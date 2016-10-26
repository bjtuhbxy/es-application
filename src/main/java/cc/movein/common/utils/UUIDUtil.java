package cc.movein.common.utils;

import java.util.UUID;

public class UUIDUtil {
	
	public static String generator(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
}
