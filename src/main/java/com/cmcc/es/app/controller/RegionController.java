package com.cmcc.es.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.model.CommonListResponse;

import com.cmcc.es.app.model.Region;
import com.cmcc.es.app.service.RegionService;

@RestController
@RequestMapping("/bizservice/region")
public class RegionController {
	@Autowired
	private RegionService regionService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public CommonListResponse<Region> all() {
		List<Region> list = regionService.getRegions();
		CommonListResponse<Region> res = new CommonListResponse<Region>(list);
		return res;
	}
}
