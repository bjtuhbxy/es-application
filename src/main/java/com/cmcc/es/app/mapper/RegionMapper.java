package com.cmcc.es.app.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cmcc.es.app.model.Region;

/**
 * 区域mapper
 * 
 * @author geyx
 *
 */
@Repository
public interface RegionMapper {
	/**
	 * 获取下级列表
	 * 
	 * @param list
	 * @return
	 */
	public List<Region> selectList(String level);
}
