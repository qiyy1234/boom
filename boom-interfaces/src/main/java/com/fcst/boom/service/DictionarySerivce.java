package com.fcst.boom.service;

import java.util.Map;


public interface DictionarySerivce {

	/**
	 * 获取某类型下所有对象
	 * @param type
	 * @return
	 */
	public String getDictionaryListByType(Map<String,Object> paramMap) throws Exception;
}
