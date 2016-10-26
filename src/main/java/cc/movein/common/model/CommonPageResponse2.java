package cc.movein.common.model;

import com.github.pagehelper.PageInfo;

/**
 * 通用含列表返回对象
 * 
 * @author geyx
 *
 */
public class CommonPageResponse2<T> extends CommonResponse {
	private PageInfo<T> page;

	public CommonPageResponse2() {
	}

	public CommonPageResponse2(PageInfo<T> page) {
		this.page = page;
	}

	public PageInfo<T> getPage() {
		return page;
	}

	public void setPage(PageInfo<T> page) {
		this.page = page;
	}
}
