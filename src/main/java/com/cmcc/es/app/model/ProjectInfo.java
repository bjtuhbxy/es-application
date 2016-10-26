package com.cmcc.es.app.model;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
/**
 * 项目信息
 * @author geyx
 *
 */
@JsonInclude(Include.NON_NULL)
public class ProjectInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1241229889848385035L;

	private String is_open;
	private String is_zgys;
	private String project_id;
	private String project_code;
	private String project_name;
	public String getIs_open() {
		return is_open;
	}
	public void setIs_open(String is_open) {
		this.is_open = is_open;
	}
	public String getIs_zgys() {
		return is_zgys;
	}
	public void setIs_zgys(String is_zgys) {
		this.is_zgys = is_zgys;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getProject_code() {
		return project_code;
	}
	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public List<TenderInfo> getProject_tender_info() {
		return project_tender_info;
	}
	public void setProject_tender_info(List<TenderInfo> project_tender_info) {
		this.project_tender_info = project_tender_info;
	}
	public String getPurchase() {
		return purchase;
	}
	public void setPurchase(String purchase) {
		this.purchase = purchase;
	}
	public String getPurchase_style_name() {
		return purchase_style_name;
	}
	public void setPurchase_style_name(String purchase_style_name) {
		this.purchase_style_name = purchase_style_name;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	public String getStop_time() {
		return stop_time;
	}
	public void setStop_time(String stop_time) {
		this.stop_time = stop_time;
	}
	private List<TenderInfo> project_tender_info;
	private String purchase;
	private String purchase_style_name;
	private String status_name;
	private String stop_time;
}
