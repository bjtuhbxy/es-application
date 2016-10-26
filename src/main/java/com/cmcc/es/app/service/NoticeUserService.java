package com.cmcc.es.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.cmcc.es.app.model.NoticeInfo;

public interface NoticeUserService {
	public HashMap<String, Set<String>> noticeUsers(List<NoticeInfo> infos);
}
