package com.cmcc.es.app.mapper;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cmcc.es.app.model.CustInfo;

@Repository
public interface CustMapper {

	void saveCustInfo(CustInfo info);
	
	CustInfo queryByMobilePhone(String mobilePhone);
	
	CustInfo queryByMobilePhoneAndPassowrd(Map<String, String> map);
	
	void updateCustInfo(CustInfo info);
	
	void modifyPassword(CustInfo info);
}
