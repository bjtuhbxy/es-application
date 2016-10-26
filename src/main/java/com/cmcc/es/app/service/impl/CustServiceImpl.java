package com.cmcc.es.app.service.impl;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmcc.es.app.mapper.CustMapper;
import com.cmcc.es.app.model.CustInfo;
import com.cmcc.es.app.model.VeriCode;
import com.cmcc.es.app.service.CustService;
import com.cmcc.es.app.service.VeriCodeService;

import cc.movein.common.model.CommonResponse;
import cc.movein.common.utils.CommonException;
import cc.movein.common.utils.Constants;

@Service
public class CustServiceImpl implements CustService {

	private Log log = LogFactory.getLog(CustServiceImpl.class);

	@Autowired
	private CustMapper custMapper;

	@Autowired
	private VeriCodeService veriCodeService;

	@Override
	public CommonResponse saveCust(CustInfo cust, String code) {
		CommonResponse data = new CommonResponse();
		try {
			String mobilePhone = cust.getMobilePhone();
			VeriCode info = new VeriCode();
			info.setServiceType(Constants.SERVICE_TYPE_REGIST_VERIFY); //注册类型
			info.setMobilePhone(mobilePhone); //设置手机号参数
			info.setCode(code); //设置验证码
			boolean success = veriCodeService.checkCode(info);
			if (success) { // 验证成功
				custMapper.saveCustInfo(cust); //保存用户信息
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

	@Override
	public CustInfo queryByMobilePhoneAndPassowrd(Map<String, String> map) {
		CustInfo cust = custMapper.queryByMobilePhoneAndPassowrd(map);
		return cust;
	}

	@Override
	public CustInfo queryByMobilePhone(String mobilePhone) {
		CustInfo cust = custMapper.queryByMobilePhone(mobilePhone);
		return cust;
	}

	@Override
	public void updateCustInfo(CustInfo info) {
		custMapper.updateCustInfo(info);

	}

	@Override
	public CommonResponse modifyPassword(CustInfo cust, String code) {
		CommonResponse data = new CommonResponse();
		try {
			String mobilePhone = cust.getMobilePhone();
			VeriCode info = new VeriCode();
			info.setServiceType(Constants.SERVICE_TYPE_RETAKE_PASSWORD);
			info.setMobilePhone(mobilePhone);
			VeriCode verify = veriCodeService.queryLastCodeInfo(info);
			if (verify == null) {
				log.error("验证码不存在！");
				data.setCode(CommonException.ERROR_DATA);
				data.setMsg("验证码不存在！");
			} else {
				String verify_code = verify.getCode();
				if (verify_code.equals(code)) {
					custMapper.modifyPassword(cust);
				} else {
					log.error("验证码错误！");
					data.setCode(CommonException.ERROR_DATA);
					data.setMsg("验证码错误！");
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			data.setCode(CommonException.ERROR_DATA);
			data.setMsg(e.getMessage());
		}
		return data;
	}

}
