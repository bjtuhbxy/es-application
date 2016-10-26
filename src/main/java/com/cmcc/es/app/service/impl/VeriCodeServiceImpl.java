package com.cmcc.es.app.service.impl;

import java.nio.charset.Charset;
import java.util.Collections;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cmcc.es.app.mapper.VeriCodeMapper;
import com.cmcc.es.app.model.CustInfo;
import com.cmcc.es.app.model.VeriCode;
import com.cmcc.es.app.service.VeriCodeService;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonResponse;
import cc.movein.common.utils.CommonException;
import cc.movein.common.utils.Constants;
import cc.movein.common.utils.SendMsgUtil;

@Service
@ConfigurationProperties(prefix = "sms.service")
public class VeriCodeServiceImpl implements VeriCodeService {

	private Log log = LogFactory.getLog(VeriCodeServiceImpl.class);
	private String url;
	private String apikey;
	private String apisecret;
	@Value("${sms.expired.time}")
	private long smsExpiredTime = 10L; //短信验证码超时时间,默认10(单位:分)
	
	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private VeriCodeMapper veriCodeMapper;

	@Override
	public CommonResponse<VeriCode> saveVeriCodeOfRegist(CustInfo cust) {
		CommonResponse<VeriCode> data = new CommonResponse<VeriCode>();
		String vcode = SendMsgUtil.createRandomVcode();
		String mobilePhone = cust.getMobilePhone();
		String loginName = cust.getLoginName();
		try {
			CommonResponse smsRes = sendSms(vcode, mobilePhone);
			if (smsRes.getCode().equals("2000")) {
				log.info("短信发送成功！");
				VeriCode info = new VeriCode();
				info.setCode(vcode);
				info.setMobilePhone(mobilePhone);
				info.setLoginName(loginName);
				info.setServiceType(Constants.SERVICE_TYPE_REGIST_VERIFY);
				info.setCreateTime(new Date());
				veriCodeMapper.saveVeriCode(info);
				data.setBody(info);
				log.info(info.toString());
			} else {
				log.error("短信发送失败！");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("短信发送失败！");
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@Override
	public VeriCode queryLastCodeInfo(VeriCode info) {
		return veriCodeMapper.queryLastCodeInfo(info);
	}

	@Override
	public CommonResponse<VeriCode> sendMessageOfPassword(CustInfo cust) {
		CommonResponse<VeriCode> data = new CommonResponse<VeriCode>();
		String vcode = SendMsgUtil.createRandomVcode();
		String mobilePhone = cust.getMobilePhone();
		String loginName = cust.getLoginName();
		try {
			CommonResponse smsRes = sendSms(vcode, mobilePhone);
			if (smsRes.getCode().equals("2000")) {
				log.info("短信发送成功！");
				VeriCode info = new VeriCode();
				info.setCode(vcode);
				info.setMobilePhone(mobilePhone);
				info.setLoginName(loginName);
				info.setServiceType(Constants.SERVICE_TYPE_RETAKE_PASSWORD);
				info.setCreateTime(new Date());
				veriCodeMapper.saveVeriCode(info);
				data.setBody(info);
				log.info(info.toString());
			} else {
				log.error("短信发送失败！");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("短信发送失败！");
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	/**
	 * 发送短信
	 * 
	 * @param vcode
	 *            验证码
	 * @param mobilePhone
	 *            手机号码
	 * @return 响应信息
	 */
	private CommonResponse sendSms(String vcode, String mobilePhone) throws BizException {
		if (apikey == null || apikey.trim().equals("")) { // 调用key为空
			throw new BizException("短信服务调用key无效,请检查application.properties中sms.service.apikey配置");
		} else if (apisecret == null || apisecret.trim().equals("")) { // 调用secret为空
			throw new BizException("短信服务调用secret无效,请检查application.properties中sms.service.apisecret配置");
		}
		StringBuffer sbParams = new StringBuffer();
		sbParams.append("mobiles=").append(mobilePhone).append("&params=").append(vcode).append("&apikey=")
				.append(apikey).append("&apisecret=").append(apisecret);
		HttpHeaders httpHeaders = new HttpHeaders();
		// 设置HTTP请求的请求头信息
		httpHeaders.setContentType(MediaType.parseMediaType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		// 设置相应内容，相应内容将被转换为json格式返回
		httpHeaders.setAcceptCharset(Collections.singletonList(Charset.forName("UTF-8")));
		httpHeaders.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		// 设置HttpEntity的Body类型为String，调用StringHttpMessageConverter转换报文体参数
		HttpEntity<String> httpEntity = new HttpEntity<String>(sbParams.toString(), httpHeaders);
		CommonResponse smsRes = restTemplate.postForObject(url, httpEntity, CommonResponse.class);
		return smsRes;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getApikey() {
		return apikey;
	}

	public void setApikey(String apikey) {
		this.apikey = apikey;
	}

	public String getApisecret() {
		return apisecret;
	}

	public void setApisecret(String apisecret) {
		this.apisecret = apisecret;
	}

	@Override
	public boolean checkCode(VeriCode veriCode) throws BizException {
		veriCode.setPeroid(smsExpiredTime);//设置验证码有效期
		VeriCode lastCode = queryLastCodeInfo(veriCode);
		if (lastCode == null || !lastCode.getCode().equals(veriCode.getCode())) { // 无匹配验证码
			log.debug("验证码错误!" + veriCode.toString());
			throw new BizException("验证码错误!");
		} else { // 验证成功
			veriCodeMapper.delCode(lastCode.getId()); //删除验证码
			return true;
		}
	}

}
