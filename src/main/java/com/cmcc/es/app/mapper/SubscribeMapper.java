package com.cmcc.es.app.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cmcc.es.app.model.Region;
import com.cmcc.es.app.model.SubscribeCatalog;
import com.cmcc.es.app.model.SubscribeInfo;

@Repository
public interface SubscribeMapper {

	/**
	 * 查询订阅列表信息
	 * 
	 * @param userId
	 * @return
	 */
	List<SubscribeInfo> querySubscribeList(String userId);

	/**
	 * 获取订阅器信息
	 * 
	 * @param subscribeId
	 * @return
	 */
	SubscribeInfo getSubscribe(String id, String userId);

	/**
	 * 保存订阅器
	 * 
	 * @param info
	 */
	void saveSubscribe(SubscribeInfo info);

	/**
	 * 保存区域
	 * 
	 * @param info
	 */
	void saveSubscribeRegion(List<Region> info);

	/**
	 * 保存采购目录
	 * 
	 * @param info
	 */
	void saveSubscribeCatalog(List<SubscribeCatalog> info);

	/**
	 * 更新订阅器
	 * 
	 * @param info
	 */
	void updateSubscribe(SubscribeInfo info);

	/**
	 * 删除订阅器
	 * 
	 * @param id
	 * @param userId
	 */
	void deleteSubscribe(String id, String userId);

	/**
	 * deleteSubscribeRegion
	 * 
	 * @param id
	 * @param userId
	 */
	void deleteSubscribeRegion(String id);

	/**
	 * 删除订阅器采购目录信息
	 * 
	 * @param id
	 * @param userId
	 */
	void deleteSubscribeCatalog(String id);

	/**
	 * 查询订阅器数量
	 * 
	 * @param userId
	 * @return
	 */
	long getSubscribeListCount(String userId);
}
