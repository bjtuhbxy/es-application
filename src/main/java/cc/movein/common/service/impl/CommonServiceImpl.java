package cc.movein.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.movein.common.mapper.CommonMapper;
import cc.movein.common.service.CommonService;

/**
 * 
 * @author geyx
 *
 */
@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private CommonMapper commonMapper;
	
	@Override
	public List<Map<String, Object>> list(Map<String, String> params) {
//		List<Map<String, Object>> query = commonMapper.list(params);
//		System.out.println(query.size());
		return null;
	}

	@Override
	public Map<String, Object> get(Map<String, String> params) {
		return null;
	}

}
