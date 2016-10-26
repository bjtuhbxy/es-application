package com.cmcc.es.app.model;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

@JacksonXmlRootElement(localName = "RETURN")
public class ResponseData {
	@JacksonXmlProperty(localName = "CODE")
	private String code = "2000";
	@JacksonXmlProperty(localName = "MSG")
	private String msg;

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

	/**
	 * 调用成功
	 * 
	 * @return
	 */
	public static ResponseData success() {
		return new ResponseData();
	}

}
