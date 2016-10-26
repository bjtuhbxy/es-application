package com.cmcc.es.app.service;

import java.util.Map;

import cc.movein.common.model.CommonResponse;

import com.cmcc.es.app.model.CustInfo;

public interface CustService {

	public CommonResponse saveCust(CustInfo info, String code);
	
	public CustInfo queryByMobilePhone(String mobilePhone);
	
	public CustInfo queryByMobilePhoneAndPassowrd(Map<String, String> map);
	
	public void updateCustInfo(CustInfo info);
	
	public CommonResponse modifyPassword(CustInfo cust, String code);
}
