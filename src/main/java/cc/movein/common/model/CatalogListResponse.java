package cc.movein.common.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 通用含列表返回对象
 * 
 * @author geyx
 *
 */
public class CatalogListResponse<T> extends CommonResponse {
	private List<T> list;
	@JsonProperty("need_update")
	private boolean needUpdate;

	public CatalogListResponse() {
	}

	public CatalogListResponse(List<T> list) {
		this.list = list;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public boolean isNeedUpdate() {
		return needUpdate;
	}

	public void setNeedUpdate(boolean needUpdate) {
		this.needUpdate = needUpdate;
	}

}
