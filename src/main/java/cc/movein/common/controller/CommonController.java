package cc.movein.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cc.movein.common.excepiton.InvalidTidException;
import cc.movein.common.mapper.CommonMapper;
import cc.movein.common.model.CommonItemResponse;
import cc.movein.common.model.CommonListResponse;
import cc.movein.common.model.CommonPageResponse;
import cc.movein.common.model.CommonResponse;
import cc.movein.common.utils.Constants;

import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/bizservice/common")
public class CommonController {

	private final Log log = LogFactory.getLog(CommonController.class);
	@Autowired
	private CommonMapper commonMapper;

	@RequestMapping("/page")
	public CommonResponse getPage(HttpServletRequest request, HttpServletResponse response) {
		CommonPageResponse res = new CommonPageResponse();
		Map<String, String[]> map = request.getParameterMap();
		// 获取有效的请求id
		String tid = request.getParameter(Constants.REQ_REQ_PARAM_TID);
		if (!StringUtils.isEmpty(tid)) { // 有参数
			Map<String, String> params = getParams(map);
			try {
				log.debug("invoke getPage");
				// 查询数据对象
				PageInfo<Map<String, Object>> page = commonMapper.getPage(params);
				res.setPage(page);
			} catch (InvalidTidException e) {
				log.error(e.getMessage(), e);
				res.setCode("2001");
				res.setMsg(e.getMessage());
			}
		} else {
			res.setCode("2001");
			res.setMsg("parameter _tid_ missed");
		}
		return res;
	}

	@RequestMapping("/list")
	public CommonListResponse<Map<String, Object>> getList(HttpServletRequest request, HttpServletResponse response) {
		CommonListResponse<Map<String, Object>> res = new CommonListResponse<Map<String, Object>>();
		Map<String, String[]> map = request.getParameterMap();
		// 获取有效的请求id
		String tid = request.getParameter(Constants.REQ_REQ_PARAM_TID);
		if (!StringUtils.isEmpty(tid)) { // 有参数
			Map<String, String> params = getParams(map);
			try {
				log.debug("invoke getList");
				// 查询数据对象
				List<Map<String, Object>> list = commonMapper.getList(params);
				res.setList(list);
			} catch (InvalidTidException e) {
				log.error(e.getMessage(), e);
				res.setCode("2001");
				res.setMsg(e.getMessage());
			}
		} else {
			res.setCode("2001");
			res.setMsg("parameter _tid_ missed");
		}
		return res;
	}

	@RequestMapping("/view")
	public CommonItemResponse<Map<String, Object>> getItem(HttpServletRequest request, HttpServletResponse response) {
		CommonItemResponse<Map<String, Object>> res = new CommonItemResponse<Map<String, Object>>();
		Map<String, String[]> map = request.getParameterMap();
		// 获取有效的请求id
		String tid = request.getParameter(Constants.REQ_REQ_PARAM_TID);
		if (!StringUtils.isEmpty(tid)) { // 有参数
			Map<String, String> params = getParams(map);
			try {
				log.debug("invoke getItem");
				Map<String, Object> item = commonMapper.getItem(params);
				res.setItem(item);
			} catch (InvalidTidException e) {
				log.error(e.getMessage(), e);
				res.setCode("2001");
				res.setMsg(e.getMessage());
			}
		} else {
			res.setCode("2001");
			res.setMsg("parameter _tid_ missed");
		}
		return res;
	}

	/**
	 * 获取请求参数中第一个有效的
	 * 
	 * @param parameterMap
	 * @return
	 */
	private Map<String, String> getParams(Map<String, String[]> parameterMap) {
		Map<String, String> params = new HashMap<String, String>();
		if (parameterMap != null) {
			Set<String> keys = parameterMap.keySet();
			String[] values = null;
			for (String key : keys) {
				values = (String[]) parameterMap.get(key);
				if (values.length > 0) {
					params.put(key, values[0]);
				}
			}
		}
		return params;
	}

}