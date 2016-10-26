package com.cmcc.es.app.service;

import com.cmcc.es.app.model.SubscribeInfo;

/**
 * 订阅器存储服务接口定义
 * 
 * @author geyx
 *
 */
public interface SubscribeStoreService {
	/**
	 * 添加订阅器
	 * 
	 * @param info
	 * @return
	 */
	public void add(SubscribeInfo info);

	/**
	 * 更新订阅器
	 * 
	 * @param info
	 * @return
	 */
	public void update(SubscribeInfo info);

	/**
	 * 删除订阅信息缓存
	 * @param info
	 */
	public void delete(String userId,SubscribeInfo info);
}
