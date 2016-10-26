package com.cmcc.es.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cmcc.es.app.service.ScmService;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonResponse;

@RestController
@RequestMapping("/bizservice/scm")
public class ScmController {
	@Autowired
	private ScmService scmService;

	/**
	 * SCM登录操作
	 * 
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码/验证码
	 * @param userType
	 *            用户类型
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public CommonResponse login(@RequestParam(name = "user_name", required = true) String userName,
			@RequestParam(name = "password", required = true) String password,
			@RequestParam(name = "user_type", required = true) String userType,
			@RequestParam(name = "checktype", required = true) String checkType) {
		CommonResponse res = new CommonResponse<>();
		try {
			scmService.login(userName, password, userType, checkType);
		} catch (BizException e) {
			res.setCode("2001");
			res.setMsg(e.getMessage());
		}
		return res;
	}
}
