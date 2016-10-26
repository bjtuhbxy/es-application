package com.cmcc.es.app.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmcc.es.app.mapper.RegionMapper;
import com.cmcc.es.app.model.Region;
import com.cmcc.es.app.service.RegionService;

/**
 * 区域服务实现
 * 
 * @author geyx
 *
 */
@Service
public class RegionServiceImpl implements RegionService {
	@Autowired
	private RegionMapper regionMapper;

	@Override
	public List<Region> getRegions() {
		// 获取第一级列表
		List<Region> lv1List = regionMapper.selectList("1");
		// 获取第二级列表
		List<Region> lv2List = regionMapper.selectList("2");
		List<Region> children = null;
		for (Region lv1Item : lv1List) {
			children = new ArrayList<Region>();
			for (Region lv2Item : lv2List) {
				if (lv2Item.getParentId().equals(lv1Item.getRegionId())) { // 如果子元素父id与一级id相同
					children.add(lv2Item);
				}
			}
			lv1Item.setChildren(children); // 设置子元素列表
		}
		return lv1List;
	}

}
