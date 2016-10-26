package cc.movein.common.mapper;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import cc.movein.common.excepiton.InvalidTidException;
import cc.movein.common.utils.Constants;
import cc.movein.common.utils.RedisConfig;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 通用Mapper，用于处理常规分页列表查询及单记录查询
 * 
 * @author geyx
 *
 */
@Repository
@ConfigurationProperties(prefix = "common")
public class CommonMapper {

	private final Log log = LogFactory.getLog(RedisConfig.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private String decode;
	
	public String getDecode() {
		return decode;
	}

	public void setDecode(String decode) {
		this.decode = decode;
	}

	/**
	 * 获取分页对象
	 * 
	 * @param params
	 * @return
	 * @throws InvalidTidException
	 */
	@Cacheable(value = "pagecache", keyGenerator = "wiselyKeyGenerator")
	public PageInfo<Map<String, Object>> getPage(Map<String, String> params) throws InvalidTidException {
		log.info("getPage未使用缓存，进行查询,参数" + params.toString());
		Map<String, String> map = new HashMap<String, String>();
		for (Map.Entry<String, String> entry : params.entrySet()){
			try {
				String decodeParam = URLDecoder.decode(entry.getValue(),decode);
				map.put(entry.getKey(), decodeParam);
			} catch (UnsupportedEncodingException e) {
				 String param = entry.getValue();
				 map.put(entry.getKey(), param);
			}
		}
		int pageNum = Constants.DEFAULT_PAGE_NUM;
		int pageSize = Constants.DEFAULT_PAGE_SIZE;
		String pageNumParam = map.get(Constants.REQ_PARAM_PAGE_NUM);
		String pageSizeParam = map.get(Constants.REQ_PARAM_PAGE_SIZE);
		if (!StringUtils.isEmpty(pageNumParam)) { // 有pageNum参数
			pageNum = Integer.parseInt(pageNumParam);
		}
		if (!StringUtils.isEmpty(pageSizeParam)) { // 有pageSize参数
			pageSize = Integer.parseInt(pageSizeParam);
		}
		String tidParam = map.get(Constants.REQ_REQ_PARAM_TID); // 请求服务参数
		PageInfo<Map<String, Object>> page = null;
		try {
//			PageHelper.startPage(pageNum, pageSize); //不进行总页码查询
			PageHelper.startPage(pageNum, pageSize, false); //不进行总页码查询
			List<Map<String, Object>> list = this.sqlSessionTemplate.selectList(tidParam, map);
			page = new PageInfo<Map<String, Object>>(list);
		} catch (DataAccessException e) { // 请求_tid_无效
			throw new InvalidTidException(tidParam, e);
		}
		return page;
	}

	@Cacheable(value = "listcache", keyGenerator = "wiselyKeyGenerator")
	public List<Map<String, Object>> getList(Map<String, String> params) throws InvalidTidException {
		log.info("getList未使用缓存，进行查询,参数" + params.toString());
		Map<String, String> map = new HashMap<String, String>();
		for (Map.Entry<String, String> entry : params.entrySet()){
			try {
				String decodeParam = URLDecoder.decode(entry.getValue(),decode);
				map.put(entry.getKey(), decodeParam);
			} catch (UnsupportedEncodingException e) {
				 String param = entry.getValue();
				 map.put(entry.getKey(), param);
			}
		}
		String tidParam = map.get(Constants.REQ_REQ_PARAM_TID); // 请求服务参数
		try {
			List<Map<String, Object>> list = this.sqlSessionTemplate.selectList(tidParam, map);
			return list;
		} catch (DataAccessException e) { // 请求_tid_无效
			throw new InvalidTidException(tidParam, e);
		}
	}

	/**
	 * 获取单一对象
	 * 
	 * @param params
	 * @return
	 * @throws InvalidTidException
	 */
	@Cacheable(value = "itemcache", keyGenerator = "wiselyKeyGenerator")
	public Map<String, Object> getItem(Map<String, String> params) throws InvalidTidException {
		log.info("getItem未使用缓存，进行查询,参数" + params.toString());
		Map<String, String> map = new HashMap<String, String>();
		for (Map.Entry<String, String> entry : params.entrySet()){
			try {
				String decodeParam = URLDecoder.decode(entry.getValue(),decode);
				map.put(entry.getKey(), decodeParam);
			} catch (UnsupportedEncodingException e) {
				 String param = entry.getValue();
				 map.put(entry.getKey(), param);
			}
		}
		String tidParam = map.get(Constants.REQ_REQ_PARAM_TID); // 请求服务参数
		Map<String, Object> item = null;
		try {
			item = this.sqlSessionTemplate.selectOne(tidParam, map);
		} catch (DataAccessException e) { // 请求_tid_无效
			throw new InvalidTidException(tidParam, e);
		}
		return item;
	}

}
