package com.cmcc.es.app.service;

import com.cmcc.es.app.model.CustInfo;
import com.cmcc.es.app.model.VeriCode;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonResponse;

public interface VeriCodeService {

	public CommonResponse saveVeriCodeOfRegist(CustInfo cust);
	
	public CommonResponse sendMessageOfPassword(CustInfo cust);
	
	public VeriCode queryLastCodeInfo(VeriCode info);
	/**
	 * 检验验证码状态
	 * @param veriCode
	 * @return
	 */
	public boolean checkCode(VeriCode veriCode) throws BizException;
	
}
