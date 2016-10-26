package com.cmcc.es.app.model;

import java.util.Date;
/**
 * 验证码对象
 * @author geyx
 *
 */
public class VeriCode {

	private String id;
	private String code;
	private String mobilePhone;
	private String serviceType;
	private String loginName;
	private Date createTime;
	private Long peroid;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getPeroid() {
		return peroid;
	}

	public void setPeroid(Long peroid) {
		this.peroid = peroid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "VeriCode [code=" + code + ", mobilePhone=" + mobilePhone
				+ ", serviceType=" + serviceType + ", loginName=" + loginName
				+ ", createTime=" + createTime + "]";
	}


}
