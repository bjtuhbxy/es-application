package com.cmcc.es.app.model;

import org.springframework.beans.factory.annotation.Value;

public class PushData {
	
	private String title;
	private String id;
	
//	@Value("${push.type_id}")
	private String type_id;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	
}
