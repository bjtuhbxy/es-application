package com.cmcc.es.app.model;

import java.io.Serializable;
import java.util.List;
/**
 * 标信息
 * @author geyx
 *
 */
public class TenderInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4310609505549985644L;
	private String tender_id;
	private String tender_name;
	private List<PackageInfo> packages;
	public String getTender_id() {
		return tender_id;
	}
	public void setTender_id(String tender_id) {
		this.tender_id = tender_id;
	}
	public String getTender_name() {
		return tender_name;
	}
	public void setTender_name(String tender_name) {
		this.tender_name = tender_name;
	}
	public List<PackageInfo> getPackages() {
		return packages;
	}
	public void setPackages(List<PackageInfo> packages) {
		this.packages = packages;
	}
	
}
