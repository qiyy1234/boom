package com.fcst.boom.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.domain.Menu;
import com.fcst.boom.service.MenuService;

/**
 * 菜单管理controller
 * @author qiyy
 * 2016-06-26
 */
@Controller
@RequestMapping("/boom/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;

	/**
	 * 进入菜单管理页面
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		
	    return "/menu";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(){
		JsonResult result = new JsonResult();
		List<Menu> list = new ArrayList<Menu>();
		List<Menu> sourcelist = menuService.getAllMenuList();
		Menu.sortList(list, sourcelist, "1", true);
		String jsonStr=JSON.toJSONString(list);
		
		System.out.println("--- ---  回调函数 -menu--  ---"+jsonStr);
		
		result.put("data", list);
		return result;
		
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	 
	 
	 
	 
}
