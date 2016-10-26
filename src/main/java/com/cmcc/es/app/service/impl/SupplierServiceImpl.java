package com.cmcc.es.app.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmcc.es.app.mapper.SupplierMapper;
import com.cmcc.es.app.model.ProjectInfo;
import com.cmcc.es.app.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	private final Log log = LogFactory.getLog(SupplierServiceImpl.class);

	@Autowired
	private SupplierMapper supplierMapper;

	@Override
	public List<ProjectInfo> list() {
		List<ProjectInfo> list = supplierMapper.list();
		return list;
	}

}
