package com.cmcc.es.app.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmcc.es.app.mapper.CustMapper;
import com.cmcc.es.app.mapper.SubscribeMapper;
import com.cmcc.es.app.model.CustInfo;
import com.cmcc.es.app.model.Region;
import com.cmcc.es.app.model.ResponseData;
import com.cmcc.es.app.model.SubscribeCatalog;
import com.cmcc.es.app.model.SubscribeInfo;
import com.cmcc.es.app.service.SubscribeService;
import com.cmcc.es.app.service.SubscribeStoreService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonPageResponse2;
import cc.movein.common.utils.UUIDUtil;

/**
 * 订阅器服务实现
 * 
 * @author geyx
 *
 */
@Service
public class SubscribeServiceImpl implements SubscribeService {
	@Autowired
	private SubscribeMapper subscribeMapper;
	@Autowired
	private SubscribeStoreService storeService;
	@Autowired
	private CustMapper custMapper; // 客户操作mapper
	@Value("${subscribe.normal-user.limit.count}")
	private Long limitSubscribeCount = 1L; // 非付费用户订阅器数量

	@Transactional
	@Override
	public ResponseData add(SubscribeInfo info) throws BizException {
		String userId = info.getSubscribeUser(); // 订阅用户id
		long count = subscribeMapper.getSubscribeListCount(userId); // 查询用户现有订阅器数量
		CustInfo custInfo = custMapper.queryByMobilePhone(userId); // 查询用户信息
		if (custInfo != null) {
			String isPayUser = custInfo.getIsPayUser(); // 是否付费用户
			Date validTimeEnd = custInfo.getValidTimeEnd(); // 用户有效期
			if (StringUtils.isEmpty(isPayUser) || isPayUser.toUpperCase().equals("N")
					|| (validTimeEnd != null && validTimeEnd.getTime() < System.currentTimeMillis())) { // 非付费用户及用户过期
				if (count >= limitSubscribeCount) { // 用户有有效订阅器,非付费状态，不支持再添加新订阅器
					throw new BizException("当前用户只可以添加" + limitSubscribeCount + "个订阅器");
				}
			}
		} else {
			throw new BizException("用户信息无效，无法添加订阅器");
		}
		String subscribeId = UUIDUtil.generator();
		info.setSubscribeId(subscribeId);
		info.setCreateTime(new Date());
		subscribeMapper.saveSubscribe(info);
		for (Region region : info.getRegions()) {
			region.setSubscribeId(subscribeId);
		}
		for (SubscribeCatalog catalog : info.getCatalogs()) {
			catalog.setSubscribeId(subscribeId);
		}
		subscribeMapper.saveSubscribeRegion(info.getRegions());
		subscribeMapper.saveSubscribeCatalog(info.getCatalogs());
		// 订阅器存储处理
		storeService.add(info);
		return ResponseData.success();
	}

	@Transactional
	@Override
	public ResponseData update(SubscribeInfo info) {
		// 更新订阅器信息
		subscribeMapper.updateSubscribe(info);
		// 删除原始订阅器区域信息
		subscribeMapper.deleteSubscribeRegion(info.getSubscribeId());
		// 删除原始订阅器采购目录信息
		subscribeMapper.deleteSubscribeCatalog(info.getSubscribeId());
		for (Region region : info.getRegions()) {
			region.setSubscribeId(info.getSubscribeId());
		}
		for (SubscribeCatalog catalog : info.getCatalogs()) {
			catalog.setSubscribeId(info.getSubscribeId());
		}
		// 保存新的订阅器区域信息
		subscribeMapper.saveSubscribeRegion(info.getRegions());
		// 保存新的订阅器采购目录信息
		subscribeMapper.saveSubscribeCatalog(info.getCatalogs());
		// 更新缓存中内容
		storeService.update(info);
		return ResponseData.success();
	}

	@Override
	public CommonPageResponse2<PageInfo> list(String userId) {
		PageHelper.startPage(1, 10);
		List<SubscribeInfo> list = subscribeMapper.querySubscribeList(userId);
		PageInfo<SubscribeInfo> page = new PageInfo<SubscribeInfo>(list);
		return new CommonPageResponse2(page);
	}

	@Transactional
	@Override
	public ResponseData delete(String id, String userId) {
		SubscribeInfo info = null;
		info = subscribeMapper.getSubscribe(id, userId);
		// 删除订阅器信息
		subscribeMapper.deleteSubscribe(id, userId);
		// 删除订阅器区域信息
		subscribeMapper.deleteSubscribeRegion(id);
		// 删除订阅器采购目录信息
		subscribeMapper.deleteSubscribeCatalog(id);
		// 删除缓存中内容
		storeService.delete(userId, info);
		return ResponseData.success();
	}
}
