package com.cmcc.es.app.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cmcc.es.app.model.CustInfo;
import com.cmcc.es.app.model.LoginInfo;
import com.cmcc.es.app.model.VeriCode;
import com.cmcc.es.app.service.CustService;
import com.cmcc.es.app.service.VeriCodeService;

import cc.movein.common.model.CommonResponse;
import cc.movein.common.utils.CommonException;
import cc.movein.common.utils.Constants;

@RestController
@RequestMapping("/bizservice/cust")
public class CustController {

	private Log log = LogFactory.getLog(CustController.class);
	// private static final String DATA_FORMAT = "yyyy-MM-dd HH:mm:ss";

	@Autowired
	private CustService custService;

	@Autowired
	private VeriCodeService veriCodeService;

	@RequestMapping(value = "/smslogin", method = RequestMethod.POST)
	public CommonResponse<LoginInfo> save(String name, @RequestParam(name = "login_name") String loginName,
			@RequestParam(name = "password", required = false) String password,
			@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "id_type", required = false) String idType,
			@RequestParam(name = "id_number", required = false) String idNumber, String address, String province,
			String city, @RequestParam(name = "zip_code", required = false) String zipCode, String birthday,
			String gender, String nationality, String race,
			@RequestParam(name = "married_status", required = false) String marriedStatus, String education,
			String occupation, String salary, @RequestParam(name = "nick_name", required = false) String nickName,
			@RequestParam(name = "is_pay_user", required = false, defaultValue = "N") String isPayUser,
			@RequestParam(name = "code") String code) {

		CommonResponse<LoginInfo> data = new CommonResponse<LoginInfo>();
		try {
			CustInfo custInfo = custService.queryByMobilePhone(mobilePhone);
			if (custInfo != null) { // 已存在用户
				VeriCode veriCode = new VeriCode();
				veriCode.setServiceType(Constants.SERVICE_TYPE_REGIST_VERIFY); // 注册类型
				veriCode.setMobilePhone(mobilePhone); // 设置手机号参数
				veriCode.setCode(code); // 设置验证码
				veriCodeService.checkCode(veriCode);
				LoginInfo loginInfo = new LoginInfo();
				// 复制属性值
				BeanUtils.copyProperties(custInfo, loginInfo);
				data.setBody(loginInfo);
			} else { // 不存在用户
				if (email == null) {
					email = mobilePhone + "@139.com";
				}
				CustInfo info = new CustInfo();
				info.setName(name);
				info.setLoginName(loginName);
				info.setPassword("e43f8d8f5f487ee008081d4f2bc15a28"); // 设置固定密码
																		// md5(esapppassword)
				info.setMobilePhone(mobilePhone);
				info.setEmail(email);
				info.setIdType(idType);
				info.setIdNumber(idNumber);
				info.setAddress(address);
				info.setProvince(province);
				info.setCity(city);
				info.setZipCode(zipCode);
				info.setBirthday(birthday);
				info.setGender(gender);
				info.setNationality(nationality);
				info.setRace(race);
				info.setMarriedStatus(marriedStatus);
				info.setEducation(education);
				info.setOccupation(occupation);
				info.setSalary(salary);
				info.setNickName(nickName);
				info.setIsPayUser(isPayUser);
				info.setCreateTime(new Date());
				CommonResponse save = custService.saveCust(info, code);
				custInfo = custService.queryByMobilePhone(mobilePhone);
				if (!save.getCode().equals("2000")) {
					return save;
				}
				LoginInfo loginInfo = new LoginInfo();
				// 复制属性值
				BeanUtils.copyProperties(custInfo, loginInfo);
				data.setBody(loginInfo);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public CommonResponse<LoginInfo> login(@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "password") String password) {
		CommonResponse<LoginInfo> data = new CommonResponse<LoginInfo>();
		Map<String, String> map = new HashMap<String, String>();
		try {
			map.put("mobilePhone", mobilePhone);
			map.put("password", password);
			CustInfo info = custService.queryByMobilePhoneAndPassowrd(map);
			if (info != null) {
				LoginInfo loginInfo = new LoginInfo();
				// 复制属性值
				BeanUtils.copyProperties(info, loginInfo);
				data.setBody(loginInfo);
				log.info("用户信息正确");
				log.info(loginInfo.toString());
			} else {
				log.error("手机号或密码错误");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("手机号或密码错误");
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public CommonResponse update(@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "is_pay_user", required = false, defaultValue = "N") String isPayUser,
			@RequestParam(name = "valid_time_end", required = false) String validTimeEnd) {
		CommonResponse data = new CommonResponse();
		try {
			CustInfo custInfo = custService.queryByMobilePhone(mobilePhone);
			if (custInfo == null) {
				log.error("用户不存在");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("用户不存在");
			} else {
				CustInfo info = new CustInfo();
				info.setMobilePhone(mobilePhone);
				info.setIsPayUser(isPayUser);
				long valid = Long.parseLong(validTimeEnd);
				info.setValidTimeEnd(new Date(valid));
				custService.updateCustInfo(info);
				log.info("信息更新成功");
			}
		} catch (NumberFormatException e) {
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg("valid_time_end is not a valid millisecond");
			log.error("valid_time_end is not a valid millisecond");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
	public CommonResponse modifyPassword(@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "password") String password, @RequestParam(name = "code") String code) {
		CommonResponse data = new CommonResponse();
		try {
			// CustInfo custInfo = custService.queryByMobilePhone(mobilePhone);
			if (password != null && code != null) {
				CustInfo info = new CustInfo();
				info.setMobilePhone(mobilePhone);
				if (password.length() >= 6 && password.length() <= 16) {
					info.setPassword(password);
				} else if (password.length() < 6) {
					log.error("密码太短，请重新输入！");
					data.setCode(CommonException.ERROR_DATA);
					data.setMsg("密码太短，请重新输入！");
					return data;
				} else if (password.length() > 16) {
					log.error("密码太长，请重新输入！");
					data.setCode(CommonException.ERROR_DATA);
					data.setMsg("密码太长，请重新输入！");
					return data;
				}
				CommonResponse modify = custService.modifyPassword(info, code);
				if (!modify.getCode().equals("2000")) {
					return modify;
				}
			} else {
				log.error("请输入您的验证码或密码！");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("请输入您的验证码或密码！");
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	/**
	 * 发送短信
	 * 
	 * @param mobilePhone
	 *            手机号
	 * @param loginName
	 *            登录名
	 * @param type
	 *            类型，1：注册下发验证码，2：找回密码下发验证码，3：公告下发
	 * @return
	 */
	@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
	public CommonResponse sendSms(@RequestParam(name = "mobile_phone", required = true) String mobilePhone,
			@RequestParam(name = "login_name", required = true) String loginName,
			@RequestParam(name = "type", required = true) String type) {
		CustInfo info = new CustInfo();
		info.setMobilePhone(mobilePhone);
		info.setLoginName(loginName);
		CommonResponse data = null;
		if (type.equals("1")) { // 注册下发验证码
			data = veriCodeService.saveVeriCodeOfRegist(info);
		} else if (type.equals("2")) { // 找回密码下发验证码
			data = veriCodeService.sendMessageOfPassword(info);
		} else if (type.equals("3")) { // 公告下发
			// TODO 公告下发
		}
		return data;
	}

	@RequestMapping(value = "/sendMessageOfRegist", method = RequestMethod.POST)
	public CommonResponse sendMessageOfRegist(@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "login_name") String loginName) {
		CustInfo info = new CustInfo();
		info.setMobilePhone(mobilePhone);
		info.setLoginName(loginName);
		CommonResponse data = veriCodeService.saveVeriCodeOfRegist(info);
		return data;
	}

	@RequestMapping(value = "/sendMessageOfPassword", method = RequestMethod.POST)
	public CommonResponse sendMessageOfPassword(@RequestParam(name = "mobile_phone") String mobilePhone,
			@RequestParam(name = "login_name") String loginName) {
		CustInfo info = new CustInfo();
		info.setMobilePhone(mobilePhone);
		info.setLoginName(loginName);
		CommonResponse data = veriCodeService.sendMessageOfPassword(info);
		return data;
	}
}
