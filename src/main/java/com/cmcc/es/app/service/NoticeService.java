package com.cmcc.es.app.service;

import com.cmcc.es.app.model.NoticeInfo;

/**
 * 公告服务
 * 
 * @author geyx
 *
 */
public interface NoticeService {
	/**
	 * 添加notice
	 * 
	 * @param content
	 */
	public void addNotice(String content);
	
	public NoticeInfo getDetail(String noticeId,String noticeType);
}
