package com.cmcc.es.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.excepiton.InvalidTidException;
import cc.movein.common.model.CommonResponse;

import com.cmcc.es.app.model.ProjectInfo;
import com.cmcc.es.app.service.SupplierService;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
@RequestMapping("/bizservice/supplier")
public class SupplierController {

	// private final Log log = LogFactory.getLog(SampleController.class);

	@Autowired
	private SupplierService supplierService;

	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public Map<String, Object> result() throws InvalidTidException, JsonProcessingException {

		CommonResponse common = new CommonResponse();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ProjectInfo> list = supplierService.list();
		map.put("code", common.getCode());
		map.put("msg", common.getMsg());
		map.put("list", list);
		return map;
	}

}
