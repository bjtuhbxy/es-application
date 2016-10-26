package com.cmcc.es.app.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class CustInfo {

	private String name;
	private String loginName;
	private String password;
	private String mobilePhone;
	private String email;
	private String idType;
	private String idNumber;
	private String address;
	private String province;
	private String city;
	private String zipCode;
	private String birthday;
	private String gender;
	private String nationality;
	private String race;
	private String marriedStatus;
	private String education;
	private String occupation;
	private String salary;
	private String nickName;
	private String isPayUser;
	private Date validTimeEnd;
	private Date createTime;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getRace() {
		return race;
	}

	public void setRace(String race) {
		this.race = race;
	}

	public String getMarriedStatus() {
		return marriedStatus;
	}

	public void setMarriedStatus(String marriedStatus) {
		this.marriedStatus = marriedStatus;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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
		return "CustInfo [name=" + name + ", loginName=" + loginName + ", password=" + password + ", mobilePhone="
				+ mobilePhone + ", email=" + email + ", idType=" + idType + ", idNumber=" + idNumber + ", address="
				+ address + ", province=" + province + ", city=" + city + ", zipCode=" + zipCode + ", birthday="
				+ birthday + ", gender=" + gender + ", nationality=" + nationality + ", race=" + race
				+ ", marriedStatus=" + marriedStatus + ", education=" + education + ", occupation=" + occupation
				+ ", salary=" + salary + ", nickName=" + nickName + ", isPayUser=" + isPayUser + ", validTimeEnd="
				+ validTimeEnd + ", createTime=" + createTime + "]";
	}
}
