package com.cmcc.es.app.service;

import cc.movein.common.excepiton.BizException;

/**
 * scm服务
 * 
 * @author geyx
 *
 */
public interface ScmService {
	/**
	 * SCM登录操作
	 * 
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码/验证码
	 * @param userType
	 *            用户类型
	 * @throws BizException
	 */
	void login(String userName, String password, String userType, String checkType) throws BizException;
}
