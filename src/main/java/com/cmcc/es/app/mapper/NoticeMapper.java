package com.cmcc.es.app.mapper;

import java.util.List;

import com.cmcc.es.app.model.Attachment;
import com.cmcc.es.app.model.NoticeInfo;
import com.cmcc.es.app.model.Product;

/**
 * 公告Mapper
 * @author geyx
 *
 */
public interface NoticeMapper {
	/**
	 * 保存公告信息
	 * @param list
	 */
	void saveNoticeList(List<NoticeInfo> list);
	/**
	 * 保存公告详情信息
	 * @param list
	 */
	void saveNoticeDetailList(List<NoticeInfo> list);
	/**
	 * 保存公告关联产品信息
	 * @param list
	 */
	void saveNoticeProductList(List<Product> list);
	/**
	 * 保存公告附件信息
	 * @param list
	 */
	void saveNoticeAttachmentList(List<Attachment> list);
	
	NoticeInfo getDetail(String noticeId,String noticeType);
	
	List<Attachment> listAttach(String noticeId);
}
