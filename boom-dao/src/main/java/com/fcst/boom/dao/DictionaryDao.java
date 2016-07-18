package com.fcst.boom.dao;

import java.util.List;
import java.util.Map;

public interface DictionaryDao {
	
	/**
	 * 获取类型下所有值
	 * @param type
	 * @return
	 */
	public List<Map<String,Object>> getDictionaryListByType(String type);
}
