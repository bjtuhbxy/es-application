package com.cmcc.es.app.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cmcc.es.app.model.ResponseData;
import com.cmcc.es.app.service.NoticeService;

/**
 * 对外接口服务
 * 
 * @author geyx
 *
 */
@RestController
public class ViewController {
	
	private Log log = LogFactory.getLog(ViewController.class);
	
	@Autowired
	private NoticeService noticeService;
	/**
	 * 数据同步action
	 */
	private static final String SYNC_DATA = "syncdata";
	private static final String DATA_TYPE_NOTICE = "notice";

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public ResponseData process(@RequestParam(name = "data-action") String action,
			@RequestParam(name = "data-type") String type, @RequestParam(name = "data-content") String content) {
		log.info("action=" + action + ",type=" + type);
		log.info("content-base64:" + content);
		if (action.equals(SYNC_DATA)) { // 数据同步操作F
			if (type.equals(DATA_TYPE_NOTICE)) {
				noticeService.addNotice(content);
			}
		}
		ResponseData data = new ResponseData();
		return data;
	}

}
