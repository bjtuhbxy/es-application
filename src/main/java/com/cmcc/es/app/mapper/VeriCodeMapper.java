package com.cmcc.es.app.mapper;

import com.cmcc.es.app.model.VeriCode;

public interface VeriCodeMapper {
	/**
	 * 保存验证码
	 * @param info
	 */
	void saveVeriCode(VeriCode info);
	/**
	 * 查询最新验证码
	 * @param info
	 * @return
	 */
	VeriCode queryLastCodeInfo(VeriCode info);
	/**
	 * 删除验证码
	 * @param id
	 */
	void delCode(String id);
}
