package com.cmcc.es.app.service;

import com.cmcc.es.app.model.ResponseData;
import com.cmcc.es.app.model.SubscribeInfo;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonPageResponse2;

/**
 * 订阅器服务
 * 
 * @author geyx
 *
 */
public interface SubscribeService {
	/**
	 * 添加订阅器
	 * 
	 * @param info
	 * @return
	 */
	public ResponseData add(SubscribeInfo info) throws BizException;

	/**
	 * 更新订阅器
	 * 
	 * @param info
	 * @return
	 */
	public ResponseData update(SubscribeInfo info);

	/**
	 * 获取订阅器列表
	 * 
	 * @param userId
	 * @return
	 */
	public CommonPageResponse2<?> list(String userId);

	/**
	 * 删除订阅器
	 * 
	 * @param id
	 *            订阅器id
	 * @param userId
	 *            用户id
	 * @return
	 */
	public ResponseData delete(String id, String userId);
}
