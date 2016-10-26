package com.cmcc.es.app.model;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 区域信息
 * 
 * @author geyx
 *
 */
@JsonInclude(Include.NON_NULL)
public class Region {

	private String id;
	@JsonProperty("subscribe_id")
	private String subscribeId; // 订阅器id
	@JsonProperty("region_id")
	private String regionId;
	@JsonProperty("region_name")
	private String regionName;
	@JsonProperty("parent_id")
	private String parentId;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	private List<Region> children;

	public List<Region> getChildren() {
		return children;
	}

	public void setChildren(List<Region> children) {
		this.children = children;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionName() {
		try {
			if (regionName != null && regionName != "") {
				return URLDecoder.decode(regionName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return regionName;
		}
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getSubscribeId() {
		return subscribeId;
	}

	public void setSubscribeId(String subscribeId) {
		this.subscribeId = subscribeId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Region [id=" + id + ", subscribeId=" + subscribeId
				+ ", regionId=" + regionId + ", regionName=" + regionName
				+ ", parentId=" + parentId + ", children=" + children + "]";
	}

}
