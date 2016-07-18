package com.fcst.boom.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.dubbo.common.utils.CollectionUtils;
import com.fcst.boom.dao.DictionaryDao;
import com.fcst.boom.service.DictionarySerivce;

public class DictionaryServiceImpl implements DictionarySerivce {
	
	@Autowired
	private DictionaryDao dictionaryDao;
	
	protected final String[] codeTag = {"dict_name", "dict_value"};

	@Override
	public String getDictionaryListByType(Map<String,Object> paramMap) {
		String dictType = (String)paramMap.get("dictType");
		String viewType = (String)paramMap.get("viewType");
		String viewValue = (String)paramMap.get("viewValue");
		String viewName = (String)paramMap.get("viewName");
		StringBuffer viewResult = new StringBuffer();
		List<Map<String,Object>> dictList = dictionaryDao.getDictionaryListByType(dictType);
		
		if(!CollectionUtils.isEmpty(dictList)){
			if(viewType.equals("select")){
				viewResult.append("<select class='form-control' id='"+viewName+"' name='"+viewName+"' data-bv-field='country'>");
        		for(int i = 0 ; i < dictList.size() ; i++){
    				String selected = "";
        			Map<String, Object> map = dictList.get(i);
            		String codeName = map.get(codeTag[0]) == null ? "" : map.get(codeTag[0]).toString();
            		String codeValue = map.get(codeTag[1]) == null ? "" : map.get(codeTag[1]).toString();
            		if(codeValue.equals(viewValue)){
            			selected = "selected='selected'";
            		}
            		viewResult.append("<option value='"+codeValue+"' "+selected+">"+codeName+"</option>");
    			}
        		viewResult.append("</select>");
			}
		}
		return viewResult.toString();
	}

	public DictionaryDao getDictionaryDao() {
		return dictionaryDao;
	}

	public void setDictionaryDao(DictionaryDao dictionaryDao) {
		this.dictionaryDao = dictionaryDao;
	}
	
	
	

}
