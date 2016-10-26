package com.cmcc.es.app.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

/**
 * 附件信息
 * 
 * @author geyx
 *
 */
@JacksonXmlRootElement(localName = "ATTACHMENT")
public class Attachment {
	private String id;
	@JsonProperty("notice_id")
	private String noticeId;
	@JacksonXmlProperty(localName = "ATTACHMENTS_TYPE")
	@JsonProperty("attachment_type")
	private String attachmentType;
	@JacksonXmlProperty(localName = "ATTACHMENTS_MODE")
	@JsonProperty("attachment_mode")
	private String attachmentMode;
	@JacksonXmlProperty(localName = "ATTACHMENTS_URL")
	@JsonProperty("attachment_url")
	private String attachmentUrl;
	@JacksonXmlProperty(localName = "ATTACHMENTS_NAME")
	@JsonProperty("attachment_name")
	private String attachmentName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getAttachmentType() {
		return attachmentType;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

	public String getAttachmentMode() {
		return attachmentMode;
	}

	public void setAttachmentMode(String attachmentMode) {
		this.attachmentMode = attachmentMode;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

	@Override
	public String toString() {
		return "Attachment [id=" + id + ", attachmentType=" + attachmentType + ", attachmentMode=" + attachmentMode
				+ ", attachmentUrl=" + attachmentUrl + ", attachmentName=" + attachmentName + "]";
	}

}
