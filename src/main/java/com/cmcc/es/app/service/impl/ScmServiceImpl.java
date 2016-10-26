package com.cmcc.es.app.service.impl;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Collections;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cmcc.es.app.service.ScmService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cc.movein.common.excepiton.BizException;
import cc.movein.common.model.CommonResponse;
import cc.movein.common.utils.Des;

/**
 * scm服务实现
 * 
 * @author geyx
 *
 */
@Service
public class ScmServiceImpl implements ScmService {
	private static Log log = LogFactory.getLog(ScmService.class);
	// 登录密码des解密的key
	@Value("${scm.service.des.key}")
	private String key;
	// scm服务
	@Value("${scm.service.url}")
	private String scmUrl;
	@Autowired
	private RestTemplate restTemplate;

	@Override
	public void login(String userName, String password, String userType, String checkType) throws BizException {
		log.debug("解密前:" + password);
		String pwd = decodePassword(password);
		log.debug("解密后：" + pwd);
		CommonResponse res = checkUser(userName, pwd, userType, checkType);
		if (!res.getCode().equals("2000")) { // 登录/下发短信不成功
			String msg = res.getMsg();
			if (msg.indexOf("6011") != -1) { // 无此用户
				msg = "用户不存在";
			}
			throw new BizException(msg);
		}
	}

	/**
	 * 解密密码
	 * 
	 * @param password
	 * @return
	 * @throws Exception
	 */
	private String decodePassword(String password) {
		// TODO des解密算法
		Des desObj = new Des();
		return desObj.strDec(password, key, null, null);
	}

	private CommonResponse checkUser(String userName, String password, String userType, String checkType)
			throws BizException {
		StringBuffer sbParams = new StringBuffer();
		sbParams.append("user_name=").append(userName).append("&password=").append(password).append("&user_type=")
				.append(userType).append("&checktype=").append(checkType);
		HttpHeaders httpHeaders = new HttpHeaders();
		// 设置HTTP请求的请求头信息
		httpHeaders.setContentType(MediaType.parseMediaType(MediaType.APPLICATION_FORM_URLENCODED_VALUE));
		// 设置相应内容，相应内容将被转换为json格式返回
		httpHeaders.setAcceptCharset(Collections.singletonList(Charset.forName("UTF-8")));
		httpHeaders.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		// 设置HttpEntity的Body类型为String，调用StringHttpMessageConverter转换报文体参数
		HttpEntity<String> httpEntity = new HttpEntity<String>(sbParams.toString(), httpHeaders);
		HttpEntity<String> checkResBody = restTemplate.postForEntity(scmUrl, httpEntity, String.class);

		// {"code":"2001","msg":"用户名或密码错误"}
		ObjectMapper mapper = new ObjectMapper();
		CommonResponse checkRes = new CommonResponse();
		try {
			checkRes = mapper.readValue(checkResBody.getBody(), CommonResponse.class);
		} catch (JsonParseException e) {
			log.error(e.getMessage(), e);
			throw new BizException("登录失败，用户名或密码错误");
		} catch (JsonMappingException e) {
			log.error(e.getMessage(), e);
			throw new BizException("登录失败，用户名或密码错误");
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			throw new BizException("登录失败，用户名或密码错误");
		}
		// CommonResponse checkRes = restTemplate.postForObject(scmUrl,
		// httpEntity, CommonResponse.class);
		return checkRes;
	}

}
