package cc.movein.common.model;

/**
 * 通用含列表返回对象
 * 
 * @author geyx
 *
 */
public class CommonItemResponse<T> extends CommonResponse {
	private T item;

	public CommonItemResponse() {
	}

	public T getItem() {
		return item;
	}

	public void setItem(T item) {
		this.item = item;
	}

	public CommonItemResponse(T item) {
		super();
		this.item = item;
	}

}
