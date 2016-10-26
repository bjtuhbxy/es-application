package com.cmcc.es.app.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 登录信息
 * 
 * @author geyx
 *
 */
@JsonInclude(Include.NON_NULL)
public class LoginInfo {
	@JsonProperty("login_name")
	private String loginName;
	@JsonProperty("mobile_phone")
	private String mobilePhone;
	@JsonProperty("email")
	private String email;
	@JsonProperty("is_pay_user")
	private String isPayUser;
	@JsonProperty("valid_time_end")
	private Date validTimeEnd;
	@JsonProperty("create_time")
	private Date createTime;

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIsPayUser() {
		return isPayUser;
	}

	public void setIsPayUser(String isPayUser) {
		this.isPayUser = isPayUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getValidTimeEnd() {
		return validTimeEnd;
	}

	public void setValidTimeEnd(Date validTimeEnd) {
		this.validTimeEnd = validTimeEnd;
	}

	@Override
	public String toString() {
		return "LoginInfo [loginName=" + loginName + ", mobilePhone=" + mobilePhone + ", email=" + email
				+ ", isPayUser=" + isPayUser + ", validTimeEnd=" + validTimeEnd + ", createTime=" + createTime + "]";
	}

}
