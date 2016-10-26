package com.cmcc.es.app.model;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

/**
 * 采购目录信息
 * 
 * @author geyx
 *
 */
@JsonInclude(Include.NON_NULL)
public class Catalog {
	private String id;
	@JsonProperty("catalog_big_id")
	@JacksonXmlProperty(localName = "CATALOG_BIG_ID")
	private String catalogBigId; // 采购大类id
	@JsonProperty("catalog_big_name")
	@JacksonXmlProperty(localName = "CATALOG_BIG_NAME")
	private String catalogBigName;// 采购大类名称
	@JsonProperty("catalog_middle_id")
	@JacksonXmlProperty(localName = "CATALOG_MIDDLE_ID")
	private String catalogMiddleId;// 采购中类id
	@JsonProperty("catalog_middle_name")
	@JacksonXmlProperty(localName = "CATALOG_MIDDLE_NAME")
	private String catalogMiddleName;// 采购中类名称
	@JsonProperty("catalog_small_id")
	@JacksonXmlProperty(localName = "CATALOG_SMALL_ID")
	private String catalogSmallId;// 采购小类id
	@JsonProperty("catalog_small_name")
	@JacksonXmlProperty(localName = "CATALOG_SMALL_NAME")
	private String catalogSmallName;// 采购小类名称
	private String catalogId;
	private String catalogName;
	private String parentId;
	private List<Catalog> children;

	public String getCatalogBigId() {
		return catalogBigId;
	}

	public void setCatalogBigId(String catalogBigId) {
		this.catalogBigId = catalogBigId;
	}

	public String getCatalogBigName() {
		try {
			if (catalogBigName != null && catalogBigName != "") {
				return URLDecoder.decode(catalogBigName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return catalogBigName;
		}
		return catalogBigName;
	}

	public void setCatalogBigName(String catalogBigName) {
		this.catalogBigName = catalogBigName;
	}

	public String getCatalogMiddleId() {
		return catalogMiddleId;
	}

	public void setCatalogMiddleId(String catalogMiddleId) {
		this.catalogMiddleId = catalogMiddleId;
	}

	public String getCatalogMiddleName() {
		try {
			if (catalogMiddleName != null && catalogMiddleName != "") {
				return URLDecoder.decode(catalogMiddleName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return catalogMiddleName;
		}
		return catalogMiddleName;
	}

	public void setCatalogMiddleName(String catalogMiddleName) {
		this.catalogMiddleName = catalogMiddleName;
	}

	public String getCatalogSmallId() {
		return catalogSmallId;
	}

	public void setCatalogSmallId(String catalogSmallId) {
		this.catalogSmallId = catalogSmallId;
	}

	public String getCatalogSmallName() {
		try {
			if (catalogSmallName != null && catalogSmallName != "") {
				return URLDecoder.decode(catalogSmallName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			return catalogSmallName;
		}
		return catalogSmallName;
	}

	public void setCatalogSmallName(String catalogSmallName) {
		this.catalogSmallName = catalogSmallName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}

	public String getCatalogName() {
		return catalogName;
	}

	public void setCatalogName(String catalogName) {
		this.catalogName = catalogName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public List<Catalog> getChildren() {
		return children;
	}

	public void setChildren(List<Catalog> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Catalog [id=" + id + ", catalogBigId=" + catalogBigId
				+ ", catalogBigName=" + catalogBigName + ", catalogMiddleId="
				+ catalogMiddleId + ", catalogMiddleName=" + catalogMiddleName
				+ ", catalogSmallId=" + catalogSmallId + ", catalogSmallName="
				+ catalogSmallName + "]";
	}

}
