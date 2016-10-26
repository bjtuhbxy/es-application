package cc.movein.common.model;

import java.util.List;

/**
 * 通用含列表返回对象
 * 
 * @author geyx
 *
 */
public class CommonListResponse<T> extends CommonResponse {
	private List<T> list;

	public CommonListResponse() {
	}

	public CommonListResponse(List<T> list) {
		this.list = list;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

}
