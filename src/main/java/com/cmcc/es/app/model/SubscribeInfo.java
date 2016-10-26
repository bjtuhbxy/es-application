package com.cmcc.es.app.model;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 订阅信息
 * 
 * @author geyx
 *
 */
public class SubscribeInfo {
	@JsonProperty("subscribe_id")
	private String subscribeId; // 订阅器id
	@JsonProperty("subscribe_name")
	private String subscribeName; // 订阅器名称
	@JsonProperty("subscribe_user")
	private String subscribeUser; // 订阅器用户
	@JsonProperty("keywords")
	private String keywords; // 关键字
	@JsonProperty("peroid_type_id")
	private String peroidTypeId; // 发布周期
	@JsonProperty("peroid_type_name")
	private String peroidTypeName; // 发布周期
	private Date createTime; // 创建时间
	private Date updateTime; // 更新时间
	private String status = "Y"; //是否有效,默认有效
	private List<Region> regions; // 区域信息
	private List<SubscribeCatalog> catalogs; // 采购目录信息

	public String getSubscribeId() {
		return subscribeId;
	}

	public void setSubscribeId(String subscribeId) {
		this.subscribeId = subscribeId;
	}

	public String getSubscribeName() {
		try {
			if (subscribeName != null && subscribeName != "") {
				return URLDecoder.decode(subscribeName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return subscribeName;
		}
		return subscribeName;
	}

	public void setSubscribeName(String subscribeName) {
		this.subscribeName = subscribeName;
	}

	public String getSubscribeUser() {
		return subscribeUser;
	}

	public void setSubscribeUser(String subscribeUser) {
		this.subscribeUser = subscribeUser;
	}

	public String getKeywords() {
		try {
			if (keywords != null && keywords != "") {
				return URLDecoder.decode(keywords, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return keywords;
		}
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public List<Region> getRegions() {
		return regions;
	}

	public void setRegions(List<Region> regions) {
		this.regions = regions;
	}

	public List<SubscribeCatalog> getCatalogs() {
		return catalogs;
	}

	public void setCatalogs(List<SubscribeCatalog> catalogs) {
		this.catalogs = catalogs;
	}

	public String getPeroidTypeId() {
		return peroidTypeId;
	}

	public void setPeroidTypeId(String peroidTypeId) {
		this.peroidTypeId = peroidTypeId;
	}

	public String getPeroidTypeName() {
		return peroidTypeName;
	}

	public void setPeroidTypeName(String peroidTypeName) {
		this.peroidTypeName = peroidTypeName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SubscribeInfo [subscribeId=" + subscribeId + ", subscribeName=" + subscribeName + ", subscribeUser="
				+ subscribeUser + ", keywords=" + keywords + ", peroidTypeId=" + peroidTypeId + ", peroidTypeName="
				+ peroidTypeName + ", createTime=" + createTime + ", updateTime=" + updateTime + ", status=" + status
				+ ", regions=" + regions + ", catalogs=" + catalogs + "]";
	}

}
