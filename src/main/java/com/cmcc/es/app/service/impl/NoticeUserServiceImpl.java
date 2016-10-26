package com.cmcc.es.app.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.cmcc.es.app.model.NoticeInfo;
import com.cmcc.es.app.model.NoticeModel;
import com.cmcc.es.app.model.Product;
import com.cmcc.es.app.model.PushData;
import com.cmcc.es.app.service.NoticeUserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class NoticeUserServiceImpl implements NoticeUserService {

	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	@Autowired
	private RestTemplate restTemplate;
	private static final String SPLIT_STRING = "--";

	@Value("${pushMsg.pushUrl}")
	private String pushUrl;

	@Value("${pushMsg.data-channel}")
	private String channel;

	@Value("${pushMsg.application}")
	private String application;

	@Value("${pushMsg.type_id}")
	private String type_id;

	private static final ObjectMapper objectMapper = new ObjectMapper();

	HashMap<String, Set<String>> map = new HashMap<String, Set<String>>();

	@Override
	public HashMap<String, Set<String>> noticeUsers(List<NoticeInfo> infos) {
		List<NoticeModel> noticeList = new ArrayList<>();
		for (NoticeInfo noticeInfo : infos) {

			
			StringBuffer keyBuffer = new StringBuffer();
			StringBuffer keyBuffer2 = new StringBuffer();

			List<Product> products = noticeInfo.getProducts();
			if (products != null) {
				NoticeModel model = null;
				for (Product product : products) {
					keyBuffer.append("*").append(SPLIT_STRING);
					// 娣诲姞鍖哄煙id
					keyBuffer.append(noticeInfo.getSourceId()).append(SPLIT_STRING);
					// 娣诲姞澶т腑灏忓垎绫籭d
					keyBuffer.append(product.getCatalogBigId()).append(SPLIT_STRING).append(product.getCatalogBigId())
							.append(product.getCatalogMiddleId()).append(SPLIT_STRING).append(product.getCatalogBigId())
							.append(product.getCatalogMiddleId()).append(product.getCatalogSmallId());
//					 System.out.println("鎷兼帴鍚庣殑Key:" + keyBuffer);
					// 娣诲姞鍏抽敭瀛桞ASE64
					keyBuffer2.append("*").append(SPLIT_STRING);
					// 娣诲姞鍖哄煙id
					keyBuffer2.append(noticeInfo.getSourceId()).append(SPLIT_STRING);
					// 娣诲姞澶т腑灏忓垎绫籭d
					keyBuffer2.append(product.getCatalogBigId()).append(SPLIT_STRING).append(product.getCatalogBigId())
							.append(product.getCatalogMiddleId()).append(SPLIT_STRING);
//					 System.out.println("鎷兼帴鍚庣殑Key2:" + keyBuffer2);
					// 鍒濇绛涢�塺edis鏈嶅姟鍣ㄤ腑鐨刱eys
					String keyBuf = keyBuffer.toString();
					String keyBuf2 = keyBuffer2.toString();
					Set<String> resultKeySet = new HashSet<String>();
					Set<String> set1 = redisTemplate.keys(keyBuf);
					Set<String> set2 = redisTemplate.keys(keyBuf2);
					resultKeySet.addAll(set1);
					resultKeySet.addAll(set2);
					// 鏍规嵁鍏抽敭瀛楃瓫閫塺edis涓殑keys
					String title = null;
					try {
						title = URLEncoder.encode(noticeInfo.getTitle(), "UTF-8");
						// System.out.println("缂栫爜鍚庣殑鍏抽敭瀛�" + title);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					// 瀹炰緥鍖栦竴涓泦鍚堝瓨鏀炬渶缁堥渶瑕佺殑閫氱煡鐢ㄦ埛
					Set<String> resultValueSets = new HashSet<String>();
					// list鏁扮粍鐢ㄤ簬瀛樻斁鎵�鏈夌鍚堟潯浠剁殑瀹屾暣key鍊�
					List<String> list = new ArrayList<String>();
					// 閬嶅巻鍒濈瓫key闆嗗悎锛屽緱鍒版渶缁堟墍闇�闆嗗悎
					for (String str : resultKeySet) {
						String result[] = str.split("--");
						// System.out.println("绗﹀悎鍚庣紑鍖归厤鏉′欢鐨勫叧閿瓧锛�" +
						// result[0]);
						Pattern pattern = Pattern.compile(result[0]);
						java.util.regex.Matcher matcher = pattern.matcher(title);
						// 鍒ゆ柇鍏抽敭瀛楁槸鍚︽垚鍔熷尮閰嶏紝涓虹湡鍒欏皢鍏冪礌鍔犲叆鏈�缁堥泦鍚�
						boolean match = matcher.find();
						if (match) {
							list.add(str);
						}
					}
					if (list.size() > 0) {
						resultValueSets = redisTemplate.opsForSet().union(list.get(0), list);
						model = new NoticeModel();
						model.setId(noticeInfo.getItemId());
						model.setTitle(noticeInfo.getTitle());
						model.setUsers(resultValueSets);
						noticeList.add(model);
					}
					// map.put(noticeInfo.getNoticeId(), resultValueSets);
				}
			}

		}
		doPush(noticeList);
		return map;
	}

	private void doPush(List<NoticeModel> list) {
		Map<String, String> request = new HashMap<String, String>();
		for (NoticeModel noticeModel : list) {

			Set<String> users = noticeModel.getUsers();
			StringBuffer usersStr = new StringBuffer();
			for (String usersString : users) {
				if (usersStr.length() != 0) {
					usersStr = usersStr.append(",").append(usersString);
				} else {
					usersStr = usersStr.append(usersString);
				}
				
			}
			String userIDs = usersStr.toString();
			request.put("data-userid", userIDs);
			PushData pushData = new PushData();
			pushData.setId(noticeModel.getId());
			pushData.setTitle(noticeModel.getTitle());
			pushData.setType_id(type_id);
			String json = null;
			try {
				json = objectMapper.writeValueAsString(pushData);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// .out.println("json is:"+json);
			String base64str = null;
			try {
				base64str = Base64.getEncoder().encodeToString(json.getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.put("data-message", base64str);
			request.put("data-action", "push");
			request.put("data-channel", channel);
			request.put("data-application", application);
			System.out.println("req is:" + request);
			String resultStr = restTemplate.postForObject(pushUrl, request, String.class);
			System.out.println(resultStr);
		}
	}

}
