package com.cmcc.es.app.model;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 采购目录信息
 * 
 * @author geyx
 *
 */
public class SubscribeCatalog extends Catalog {
	@JsonProperty("subscribe_id")
	private String subscribeId; // 订阅器id

	public String getSubscribeId() {
		return subscribeId;
	}

	public void setSubscribeId(String subscribeId) {
		this.subscribeId = subscribeId;
	}

	@Override
	public String toString() {
		return "SubscribeCatalog [id=" + getId() + ", subscribeId=" + subscribeId + ", getCatalogBigId()="
				+ getCatalogBigId() + ", getCatalogBigName()=" + getCatalogBigName() + ", getCatalogMiddleId()="
				+ getCatalogMiddleId() + ", getCatalogMiddleName()=" + getCatalogMiddleName()
				+ ", getCatalogSmallId()=" + getCatalogSmallId() + ", getCatalogSmallName()=" + getCatalogSmallName()
				+ "]";
	}

}
