package com.fcst.boom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fcst.boom.common.JsonResult;
import com.fcst.boom.service.DictionarySerivce;
import com.fcst.boom.web.util.HttpRequestUtil;

@Controller
@RequestMapping("/boom/dictionary")
public class DictionaryController {
	
	/**
	 * 字典表Service
	 */
	@Autowired
	private DictionarySerivce dictionaryService;
	
	/**
	 * 通过类型获取字典表值
	 * @param map
	 * @return
	 */
	@RequestMapping("/typelist")
	@ResponseBody
	public JsonResult getFormViewByType(HttpServletRequest request){
		//参数有：要显示的名 viewName   类型：type 性别、状态等  ,要显示的类型 select,radio等
		JsonResult jsonResult = new JsonResult();
		Map<String,Object> paramMap = HttpRequestUtil.getReqParaMap(request);
		
		try {
			String result = dictionaryService.getDictionaryListByType(paramMap);
			System.out.println("-----------------------dictionnary----result:"+result);
			jsonResult.put("result", true);
			jsonResult.put("msg", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonResult.put("result", false);
			jsonResult.put("msg", "获取字典数据失败");
		}
		
		return jsonResult;
	}

	public DictionarySerivce getDictionaryService() {
		return dictionaryService;
	}

	public void setDictionaryService(DictionarySerivce dictionaryService) {
		this.dictionaryService = dictionaryService;
	}
	
	
}
