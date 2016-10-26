package com.cmcc.es.app.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.cmcc.es.app.mapper.CatalogMapper;
import com.cmcc.es.app.model.Catalog;
import com.cmcc.es.app.service.CatalogService;

@Service
@ConfigurationProperties(prefix = "catalog.cache.getCatalog", locations = "classpath:redis_config/catalog.properties")
public class CatalogServiceImpl implements CatalogService {

	private final Log log = LogFactory.getLog(CatalogServiceImpl.class);

	@Autowired
	private CatalogMapper catalogMapper;

	@Autowired
	private RedisTemplate redisTemplate;

	private Long timeout = -1L;

	public Long getTimeout() {
		if(timeout == -1L){
			return DEFAULT_TIMEOUT;
		}
		return timeout;
	}

	public void setTimeout(Long timeout) {
		this.timeout = timeout;
	}

	private static final Long DEFAULT_TIMEOUT = 10L;

	private static final String KEY_GET_CATALOG = "cc.movein.common.service.impl.CatalogServiceImpl.getCatalog";

	@Override
	public List<Catalog> getCatalog() {
//		List<Catalog> list = (List<Catalog>) redisTemplate.opsForValue().get(KEY_GET_CATALOG);
//		if (list != null) {
//			log.info("使用log缓存");
//		} else {
//			log.info("未使用log缓存");
//		}
		List<Catalog> bigList = catalogMapper.selectParentList();
		List<Catalog> midList = catalogMapper.selectSonList();
		List<Catalog> smlList = catalogMapper.selectGrSonList();
		for (Catalog catalog : bigList) {
			String bigId = catalog.getCatalogBigId(); // 当前一级CODE
			List<Catalog> tmpChildren = new ArrayList<Catalog>(); // 创建临时二级列表
			for (Catalog catalog2 : midList) {
				if (bigId.equals(catalog2.getParentId())) { // 如果二层catalog中一层CODE与当前相�?
					tmpChildren.add(catalog2); // 添加
				}
				String middleId = catalog2.getCatalogMiddleId(); // 当前二级CODE
				List<Catalog> tmpChildren2 = new ArrayList<Catalog>(); // 创建临时三级列表
				for (Catalog catalog3 : smlList) {
					if (middleId.equals(catalog3.getParentId())) { // 如果三层catalog中二层CODE与当前相�?
						tmpChildren2.add(catalog3); // 添加
					}
				}
				catalog2.setChildren(tmpChildren2);
			}
			catalog.setChildren(tmpChildren);
		}
//		redisTemplate.opsForValue().set(KEY_GET_CATALOG, bigList, getTimeout(), TimeUnit.SECONDS);
		return bigList;
	}

}
