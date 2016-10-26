package com.cmcc.es.app.model;

import java.util.Set;

public class NoticeModel {
	/*Map<String, Set<String>> map;
	String noticeTitle;
	public Map<String, Set<String>> getMap() {
		return map;
	}
	public void setMap(Map<String, Set<String>> map) {
		this.map = map;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}*/
	private String id;
	private String title;
	private Set<String> users;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Set<String> getUsers() {
		return users;
	}
	public void setUsers(Set<String> users) {
		this.users = users;
	}
	
}
