package com.cmcc.es.app.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import cc.movein.common.utils.XmlTools;

import com.cmcc.es.app.mapper.NoticeMapper;
import com.cmcc.es.app.model.Attachment;
import com.cmcc.es.app.model.NoticeInfo;
import com.cmcc.es.app.model.NoticeSyncData;
import com.cmcc.es.app.model.Product;
import com.cmcc.es.app.service.NoticeService;
import com.cmcc.es.app.service.NoticeUserService;

/**
 * 公告对外同步服务实现
 * 
 * @author geyx
 *
 */
@Service
public class NoticeServiceImpl implements NoticeService {

	private Log log = LogFactory.getLog(NoticeService.class);
	private static final String DATA_FORMAT = "yyyy-MM-dd HH:mm:ss";
	@Autowired
	private NoticeMapper noticeMapper;

	// @Autowired
	// private NoticeUserService noticeUserService;

	@Transactional
	@Override
	public void addNotice(String content) {
		try {
			String decodedXml = new String(Base64Utils.decodeFromString(content), "utf-8");
			log.debug(decodedXml);
			try {
				NoticeSyncData data = XmlTools.xmlStringToBean(decodedXml, NoticeSyncData.class, DATA_FORMAT);
				List<NoticeInfo> lstNotice = data.getList();
				if (lstNotice != null && lstNotice.size() > 0) {
					// 保存公告信息
					noticeMapper.saveNoticeList(data.getList());
					// 保存公告详情信息
					noticeMapper.saveNoticeDetailList(data.getList());
					// 加工后产品列表
					List<Product> lstProductNew = new ArrayList<Product>();
					// 加工后附件列表
					List<Attachment> lstAttchmentNew = new ArrayList<Attachment>();
					for (NoticeInfo noticeInfo : lstNotice) {
						// 产品列表
						List<Product> lstProduct = noticeInfo.getProducts();
						if (lstProduct != null) { // 有关联的产品信息
							for (Product product : lstProduct) { // 循环设置产品关联的公告ID
								product.setNoticeId(noticeInfo.getNoticeId());
							}
							lstProductNew.addAll(lstProduct); // 添加所有产品列表
						}
						// 附件列表
						List<Attachment> lstAttach = noticeInfo.getAttachments();
						if (lstAttach != null) { // 有关联的附件信息
							for (Attachment attachment : lstAttach) {
								attachment.setNoticeId(noticeInfo.getNoticeId());
							}
							lstAttchmentNew.addAll(lstAttach);
						}
					}
					if (lstProductNew.size() > 0) {
						// 保存产品信息
						noticeMapper.saveNoticeProductList(lstProductNew);
					}
					if (lstAttchmentNew.size() > 0) {
						// 保存附件信息
						noticeMapper.saveNoticeAttachmentList(lstAttchmentNew);
					}
					// 获取用户并推送
					// noticeUserService.noticeUsers(lstNotice);
				}
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

	@Override
	public NoticeInfo getDetail(String noticeId, String noticeType) {
		return noticeMapper.getDetail(noticeId, noticeType);
	}

}
