package com.cmcc.es.app.model;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

/**
 * 产品信息
 * 
 * @author geyx
 *
 */
public class Product extends Catalog {
	private String noticeId;
	@JacksonXmlProperty(localName = "PRODUCT_ID")
	private String productId;
	@JacksonXmlProperty(localName = "PRODUCT_NAME")
	private String productName;

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
