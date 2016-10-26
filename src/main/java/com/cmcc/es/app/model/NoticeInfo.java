package com.cmcc.es.app.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

/**
 * @author geyx
 *
 */
@JacksonXmlRootElement(localName = "NOTICE")
@JsonInclude(Include.NON_NULL)
public class NoticeInfo {
	@JacksonXmlProperty(localName = "ITEM_ID")
	private String itemId;
	@JacksonXmlProperty(localName = "NOTICE_ID")
	private String noticeId;
	@JacksonXmlProperty(localName = "PROJECT_NAME")
	private String projectName;
	@JacksonXmlProperty(localName = "PROJECT_CODE")
	private String projectCode;
	@JacksonXmlProperty(localName = "TITLE")
	private String title;
	@JacksonXmlProperty(localName = "PUB_TIME")
	private Date pubTime;
	@JacksonXmlProperty(localName = "PUB_PERSON")
	private String pubPerson;
	@JacksonXmlProperty(localName = "CONTENTS")
	private String content;
	@JacksonXmlProperty(localName = "NOTICE_TYPE_ID")
	private String noticeTypeId;
	@JacksonXmlProperty(localName = "NOTICE_TYPE_NAME")
	private String noticeTypeName;
	@JacksonXmlProperty(localName = "SOURCE_ID")
	private String sourceId;
	@JacksonXmlProperty(localName = "SOURCE_NAME")
	private String sourceName;
	@JacksonXmlProperty(localName = "TENDER_SALE_DEADLINE")
	private Date tenderSaleDeadline;
	@JacksonXmlProperty(localName = "BACK_DATE")
	private Date backDate;
	@JacksonXmlProperty(localName = "START_TIME")
	private Date startTime;
	@JacksonXmlProperty(localName = "END_TIME")
	private Date endTime;
	@JacksonXmlElementWrapper(localName = "PRODUCTS")
	private List<Product> products;
	@JacksonXmlElementWrapper(localName = "ATTACHMENTS")
	private List<Attachment> attachments;

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPubTime() {
		return pubTime;
	}

	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}

	public String getPubPerson() {
		return pubPerson;
	}

	public void setPubPerson(String pubPerson) {
		this.pubPerson = pubPerson;
	}

	public String getNoticeTypeId() {
		return noticeTypeId;
	}

	public void setNoticeTypeId(String noticeTypeId) {
		this.noticeTypeId = noticeTypeId;
	}

	public String getNoticeTypeName() {
		return noticeTypeName;
	}

	public void setNoticeTypeName(String noticeTypeName) {
		this.noticeTypeName = noticeTypeName;
	}

	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	public String getSourceName() {
		return sourceName;
	}

	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}

	public Date getTenderSaleDeadline() {
		return tenderSaleDeadline;
	}

	public void setTenderSaleDeadline(Date tenderSaleDeadline) {
		this.tenderSaleDeadline = tenderSaleDeadline;
	}

	public Date getBackDate() {
		return backDate;
	}

	public void setBackDate(Date backDate) {
		this.backDate = backDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "NoticeInfo [itemId=" + itemId + ", noticeId=" + noticeId + ", projectName=" + projectName
				+ ", projectCode=" + projectCode + ", title=" + title + ", pubTime=" + pubTime + ", pubPerson="
				+ pubPerson + ", content=" + content + ", noticeTypeId=" + noticeTypeId + ", noticeTypeName="
				+ noticeTypeName + ", sourceId=" + sourceId + ", sourceName=" + sourceName + ", tenderSaleDeadline="
				+ tenderSaleDeadline + ", backDate=" + backDate + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", products=" + products + ", attachments=" + attachments + "]";
	}
	
}
