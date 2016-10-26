package com.cmcc.es.app.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cmcc.es.app.model.ProjectInfo;

@Repository
public interface SupplierMapper {
	/**
	 * 用户列表
	 * 
	 * @return
	 */
	List<ProjectInfo> list();
}
