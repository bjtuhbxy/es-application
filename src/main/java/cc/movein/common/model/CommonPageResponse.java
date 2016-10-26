package cc.movein.common.model;

import java.util.Map;

import com.github.pagehelper.PageInfo;

/**
 * 通用含列表返回对象
 * 
 * @author geyx
 *
 */
public class CommonPageResponse extends CommonResponse {
	private PageInfo<Map<String, Object>> page;

	public PageInfo<Map<String, Object>> getPage() {
		return page;
	}

	public void setPage(PageInfo<Map<String, Object>> page) {
		this.page = page;
	}
}
