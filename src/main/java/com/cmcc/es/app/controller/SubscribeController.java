package com.cmcc.es.app.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cmcc.es.app.model.ResponseData;
import com.cmcc.es.app.model.SubscribeInfo;
import com.cmcc.es.app.service.SubscribeService;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonPageResponse2;

@RestController
@RequestMapping("/bizservice/subscribe")
public class SubscribeController {

	private final Log log = LogFactory.getLog(SubscribeController.class);
	@Autowired
	private SubscribeService subscribeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public CommonPageResponse2 list(String userId) {
		log.debug("userId:" + userId);
		return subscribeService.list(userId);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ResponseData add(@RequestBody SubscribeInfo info) {
		ResponseData data = new ResponseData();
		log.debug(info);
		try {
			data = subscribeService.add(info);
		} catch (BizException e) {
			log.error(e.getMessage());
			data.setCode("2001");
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseData update(@RequestBody SubscribeInfo info) {
		log.debug(info);
		return subscribeService.update(info);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseData delete(@RequestParam("id") String id, @RequestParam("user_id") String userId) {
		log.debug("delete id:" + id);
		return subscribeService.delete(id, userId);
	}
}
