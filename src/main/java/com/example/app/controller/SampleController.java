package com.example.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.excepiton.InvalidTidException;
import cc.movein.common.model.CommonResponse;

import com.example.app.model.Sample;
import com.example.app.service.SampleService;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping("/bizservice/sample")
public class SampleController {

	// private final Log log = LogFactory.getLog(SampleController.class);

	@Autowired
	private SampleService sampleService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public Map<String, Object> list() throws InvalidTidException, JsonProcessingException {

		CommonResponse common = new CommonResponse();
		Map<String, Object> map = new HashMap<String, Object>();
		List<Sample> list = sampleService.list();
		map.put("code", common.getCode());
		map.put("msg", common.getMsg());
		map.put("list", list);
		return map;
	}

}
