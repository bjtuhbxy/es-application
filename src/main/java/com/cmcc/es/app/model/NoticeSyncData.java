package com.cmcc.es.app.model;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

@JacksonXmlRootElement(localName = "ROOT")
public class NoticeSyncData {
	@JacksonXmlElementWrapper(localName = "LIST")
	@JacksonXmlProperty(localName = "NOTICE")
	private List<NoticeInfo> list;

	public List<NoticeInfo> getList() {
		return list;
	}

	public void setList(List<NoticeInfo> list) {
		this.list = list;
	}

}
