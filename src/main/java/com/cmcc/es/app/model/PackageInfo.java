package com.cmcc.es.app.model;

import java.io.Serializable;
/**
 * 包信息
 * @author geyx
 *
 */
public class PackageInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1895735313843590464L;
	private String package_id;
	private String package_name;
	private String tender_id;
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public String getTender_id() {
		return tender_id;
	}
	public void setTender_id(String tender_id) {
		this.tender_id = tender_id;
	}
}
