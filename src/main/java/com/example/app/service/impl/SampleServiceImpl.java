package com.example.app.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.example.app.mapper.SampleMapper;
import com.example.app.model.Sample;
import com.example.app.service.SampleService;

@Service
@ConfigurationProperties(prefix = "sample.cache.list", locations = "classpath:redis_config/sample.properties")
public class SampleServiceImpl implements SampleService {

	private final Log log = LogFactory.getLog(SampleServiceImpl.class);

	@Autowired
	private SampleMapper sampleMapper;

	@Autowired
	@Qualifier("redisTemplate")
	private RedisTemplate redisTemplate;

	private Long timeout = 60L;

	public Long getTimeout() {
		return timeout;
	}

	public void setTimeout(Long timeout) {
		this.timeout = timeout;
	}

	private static final String KEY_GET_LIST = "cc.movein.common.service.impl.CatalogServiceImpl.getCatalog";

	@Override
	public List<Sample> list() {
//		List<Sample> list = (List<Sample>) redisTemplate.opsForValue().get(KEY_GET_LIST);
//		if (list != null) {
//			log.info("存在缓存");
//		} else {
//			log.info("不存在缓存");
//		}
		List<Sample> list = sampleMapper.list();
//		redisTemplate.opsForValue().set(KEY_GET_LIST, list, timeout, TimeUnit.SECONDS);
		return list;
	}

}
