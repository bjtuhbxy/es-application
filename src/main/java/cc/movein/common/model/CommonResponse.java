package cc.movein.common.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * 通用返回对象
 * 
 * @author geyx
 *
 */
@JsonInclude(Include.NON_NULL)
public class CommonResponse<T> {
	private String code = "2000";
	private String msg = "";
	private T body;
	
	public CommonResponse(){}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public static CommonResponse success() {
		return new CommonResponse();
	}

	public T getBody() {
		return body;
	}

	public void setBody(T body) {
		this.body = body;
	}

}
