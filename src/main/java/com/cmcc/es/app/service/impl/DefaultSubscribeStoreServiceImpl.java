package com.cmcc.es.app.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Service;

import com.cmcc.es.app.mapper.SubscribeMapper;
import com.cmcc.es.app.model.Region;
import com.cmcc.es.app.model.SubscribeCatalog;
import com.cmcc.es.app.model.SubscribeInfo;
import com.cmcc.es.app.service.SubscribeStoreService;

/**
 * 默认订阅存储实现
 * 
 * @author geyx
 *
 */
@Service
public class DefaultSubscribeStoreServiceImpl implements SubscribeStoreService {

	private Log log = LogFactory.getLog(SubscribeStoreService.class);
	@Autowired
	private SubscribeMapper subscribeMapper;
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	private SetOperations<String, String> setOps;
	private static final String SPLIT_STRING = "--";

	@Override
	public void add(SubscribeInfo info) {
		List<String> lstKey = getKeys(info);
		// redisTemplate.convertAndSend(channel, message);
		setOps = redisTemplate.opsForSet();
		for (String key : lstKey) {
			// 添加用户到redis缓存中
			setOps.add(key, info.getSubscribeUser());
		}
		// Set<String> keys = redisTemplate.keys("*--he--12--1201--120105");
		// String key1 = "KASLSLS--he--12--1201--120105";
		// String keyword = key1.split(SPLIT_STRING)[0];
		// String title = "测试标题";
		// try {
		// // 添加关键字URL编码结果
		// title = URLEncoder.encode(title, "UTF-8");
		// } catch (UnsupportedEncodingException e) {
		// log.error(e.getMessage(), e);
		// }
		// String regEx = "[keyword]";
		// Pattern pat = Pattern.compile(regEx);
		// Matcher mat = pat.matcher(title);
		// boolean match = mat.find();
		// if(match){
		// //TODO
		// }
	}

	private List<String> getKeys(SubscribeInfo info) {
		// 关键字
		String keyword = info.getKeywords();
		// 区域
		List<Region> regions = info.getRegions();
		// 采购目录
		List<SubscribeCatalog> catalogs = info.getCatalogs();
		// key规则列表
		List<String> lstKey = new ArrayList<String>();
		// 缓存串临时变量
		StringBuffer keyBuffer;
		if (!StringUtils.isEmpty(keyword)) { // 有关键字
			// 关键字
			String[] keywords = keyword.split(",");
			// 拼接key，格式如下："单个关键字URL编码结果--区域ID--大类ID--中类ID--小类ID"
			// 例
			for (int i = 0; i < keywords.length; i++) {
				String item = keywords[i];
				String urlEncodeItem = null;
				try {
					// 添加关键字URL编码结果
					urlEncodeItem = URLEncoder.encode(item, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					log.error(e.getMessage(), e);
				}
				for (Region region : regions) {
					for (SubscribeCatalog catalog : catalogs) {
						keyBuffer = new StringBuffer();
						// 添加关键字BASE64
						keyBuffer.append(urlEncodeItem).append(SPLIT_STRING);
						// 添加区域id
						keyBuffer.append(region.getRegionId()).append(SPLIT_STRING);
						// 添加大中小分类id
						keyBuffer.append(catalog.getCatalogBigId()).append(SPLIT_STRING)
								.append(catalog.getCatalogMiddleId());
						// 添加小分类id
						if (!StringUtils.isEmpty(catalog.getCatalogSmallId())) { // 包含小类内容
							keyBuffer.append(SPLIT_STRING).append(catalog.getCatalogSmallId());
						}
						log.info("user:" + info.getSubscribeUser() + ",cache_key:" + keyBuffer.toString());
						// 将生成KEY的添加到key列表中
						lstKey.add(keyBuffer.toString());
					}
				}
			}
		} else { // 无关键字
			for (Region region : regions) {
				for (SubscribeCatalog catalog : catalogs) {
					keyBuffer = new StringBuffer();
					// 添加区域id
					keyBuffer.append(region.getRegionId()).append(SPLIT_STRING);
					// 添加大中小分类id
					keyBuffer.append(catalog.getCatalogBigId()).append(SPLIT_STRING)
							.append(catalog.getCatalogMiddleId());
					// 添加小分类id
					if (!StringUtils.isEmpty(catalog.getCatalogSmallId())) { // 包含小类内容
						keyBuffer.append(SPLIT_STRING).append(catalog.getCatalogSmallId());
					}
					log.info("user:" + info.getSubscribeUser() + ",cache_key:" + keyBuffer.toString());
					// 将生成KEY的添加到key列表中
					lstKey.add(keyBuffer.toString());
				}
			}
		}
		return lstKey;
	}

	@Override
	public void update(SubscribeInfo info) {
		// 先删除订阅用户缓存
		delete(info.getSubscribeId(), info.getSubscribeUser());
		// 再重新添加订阅用户缓存
		add(info);
	}

	public void delete(String id, String userId) {
		// 查询原订阅器信息
		SubscribeInfo info = subscribeMapper.getSubscribe(id, userId);
		List<String> lstKey = getKeys(info);
		setOps = redisTemplate.opsForSet();
		for (String key : lstKey) { // 循环删除在redis中关联的用户内容
			setOps.remove(key, userId);
		}
	}

	@Override
	public void delete(String userId, SubscribeInfo info) {
		if (info != null) {
			List<String> lstKey = getKeys(info);
			if (lstKey != null) {
				setOps = redisTemplate.opsForSet();
				for (String key : lstKey) { // 循环删除在redis中关联的用户内容
					log.info("即将删除订阅器[" + key + "]关联用户：" + userId);
					setOps.remove(key, userId);
				}
			}
		}
	}

}
