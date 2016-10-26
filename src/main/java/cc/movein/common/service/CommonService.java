package cc.movein.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {
	/**
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> list(Map<String,String> params);

	/**
	 * 
	 * @param params
	 * @return
	 */
	Map<String, Object> get(Map<String,String> params);
}
