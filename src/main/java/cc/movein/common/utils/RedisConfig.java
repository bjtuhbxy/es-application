package cc.movein.common.utils;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

@EnableCaching
@Configuration
public class RedisConfig extends CachingConfigurerSupport {
	private final Log log = LogFactory.getLog(RedisConfig.class);
	@Value("${spring.redis.default.expiration}")
	private long defaultExpiration = 600L; // 缓存超时时间，默认10分钟

	@Bean
	public KeyGenerator wiselyKeyGenerator() {
		return new KeyGenerator() {
			@Override
			public Object generate(Object target, Method method, Object... params) {
				log.debug("wiselyKeyGenerator:target=" + target.getClass().getName() + ",method=" + method.getName());
				StringBuilder sb = new StringBuilder();
				sb.append(target.getClass().getName());
				sb.append(method.getName());
				if (params[0] != null && params[0] instanceof Map) { // 通用Map参数
					log.debug("当前为通用单参数(Map)方法");
					@SuppressWarnings("unchecked")
					Map<String, ?> param = (Map<String, ?>) params[0];
					Set<String> keys = param.keySet();
					for (String key : keys) {
						if (!key.equals("_")) { // key生成结构中忽略“_”参数
							sb.append(param.get(key).toString());
						}
					}
				} else {
					for (Object obj : params) {
						sb.append(obj.toString());
					}
				}
				String cacheKey = sb.toString();
				log.debug("cacheKey:" + cacheKey);
				// 将请求参数拼接后做MD5
				String md5CacheKey = MD5Util.getMD5String(cacheKey);
				log.debug("md5CacheKey:" + md5CacheKey);
				return md5CacheKey;
			}
		};

	}

	@Bean
	public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory factory) {
		StringRedisTemplate template = new StringRedisTemplate(factory);
		Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
		ObjectMapper om = new ObjectMapper();
		om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
		om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
		jackson2JsonRedisSerializer.setObjectMapper(om);
		template.setValueSerializer(jackson2JsonRedisSerializer);
		template.afterPropertiesSet();
		return template;
	}

	@Bean
	public CacheManager cacheManager(RedisTemplate redisTemplate) {
		RedisCacheManager cacheManager = new RedisCacheManager(redisTemplate);
		// Number of seconds before expiration. Defaults to unlimited (0)
		// Sets the default expire time
		cacheManager.setDefaultExpiration(defaultExpiration);
		return cacheManager;
	}
}
