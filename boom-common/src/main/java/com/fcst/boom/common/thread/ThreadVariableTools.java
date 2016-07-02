package com.fcst.boom.common.thread;

import java.util.Hashtable;
import java.util.Map;

/**
 * Description:线程变量工具类
 * Copyright (C) 2014 boco.com.cn All Right Reserved.
 * Author：LanChao
 * Create Date: 2014年12月3日
 * Modified By：
 * Modified Date：
 * Why & What is modified：
 * Version 1.0
 */
public class ThreadVariableTools {
	
	private static ThreadLocal<Map<String, Object>> threadLocal = new ThreadLocal<Map<String, Object>>();

	/**
	 * Definition:设置线程变量
	 * @param key 变量KEY
	 * @param object 变量值
	 * @Author: LanChao
	 * @Created date: 2014年12月3日
	 */
	public static void setVariable(String key, Object object) {
		if (object == null)
			return;
		Map<String, Object> _map = threadLocal.get();
		if (_map != null) {
			_map.put(key, object);
		} else {
			Map<String, Object> initMap = new Hashtable<String, Object>(3);
			initMap.put(key, object);
			threadLocal.set(initMap);
		}
	}

	/**
	 * Definition:取出线程变量
	 * @param key 变量KEY
	 * @return 变量值
	 * @Author: LanChao
	 * @Created date: 2014年12月3日
	 */
	public static Object getVariable(String key) {
		Map<String, Object> _map = threadLocal.get();
		if (_map != null) {
			return _map.get(key);
		} else {
			return null;
		}
	}


}

