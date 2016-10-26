package com.cmcc.es.app.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.model.CommonItemResponse;

import com.cmcc.es.app.model.NoticeInfo;
import com.cmcc.es.app.service.NoticeService;

/**
 * 公告controller
 * 
 * @author geyx
 *
 */
@RestController
@RequestMapping("/bizservice/notice")
public class NoticeController {

	private Log log = LogFactory.getLog(NoticeController.class);
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public CommonItemResponse<NoticeInfo> detail(@RequestParam(name = "notice_id") String noticeId,
			@RequestParam(name = "notice_type", defaultValue = "公告类型ID") String noticeType) {
		log.debug("notice detail params:notice_id=" + noticeId + ",notice_type=" + noticeType);
		NoticeInfo info = noticeService.getDetail(noticeId, noticeType);
		log.debug(info);
		CommonItemResponse<NoticeInfo> res = new CommonItemResponse<NoticeInfo>(info);
		return res;
	}
}
