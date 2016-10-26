package com.cmcc.es.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.model.CatalogListResponse;

import com.cmcc.es.app.model.Catalog;
import com.cmcc.es.app.service.CatalogService;

@RestController
@RequestMapping("/bizservice/catalog")
public class CatalogController {
	@Autowired
	private CatalogService catalogService;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public CatalogListResponse<Catalog> all() {
		List<Catalog> list = catalogService.getCatalog();
		CatalogListResponse<Catalog> res = new CatalogListResponse<Catalog>(list);
		res.setNeedUpdate(true);
		return res;
	}
}
