package com.fcst.boom.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.domain.ActiveUser;
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

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	/**
	 * 进入菜单管理页面
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		
		System.err.println("------menu.do基础-----开始-----");
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		 System.err.println("------menu.do基础-----开始-----"+activeUser.getName());
		model.addAttribute("activeUser", activeUser);
		System.err.println("------menu.do基础-----结束-----");
		
	    return "/menu";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(){
		JsonResult result = new JsonResult();
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		List<Menu> list = new ArrayList<Menu>();
		List<Menu> sourcelist = null;
		 if (activeUser.isAdmin()){
				sourcelist = menuService.findAllList(new Menu());
			}else{
				Menu menu = new Menu();
				menu.setUserId(activeUser.getUserid());
				sourcelist = menuService.findByUserId(menu);
			}
		
		Menu.sortList(list, sourcelist, "0", true);
		String jsonStr=JSON.toJSONString(list);
		
		System.out.println("--- ---  回调函数 -menu--  ---"+jsonStr);
		
		result.put("data", list);
		return result;
		
	}
	
	/**
	 * 跳转权限菜单 递归java
	 * @return
	 */
	@RequestMapping("/powerMenuDG")
	@ResponseBody
	public JsonResult powerMenuDG(){
		JsonResult result = new JsonResult();
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		List<Menu> sourceList = null;
		 if (activeUser.isAdmin()){
			    sourceList = menuService.findAllList(new Menu());
			}else{
				Menu menu = new Menu();
				menu.setUserId(activeUser.getUserid());
				sourceList = menuService.findByUserId(menu);
			}
		
		result.put("zTreeNodes", sourceList);
		return result;
	}
	
	@RequestMapping("/saveMenu")
	@ResponseBody
	public JsonResult saveMenu(@RequestBody Menu menu){
		JsonResult result = new JsonResult();
		try {
			// 这里可以写一获取时间与人物的构造方法
			Subject subject = SecurityUtils.getSubject();
			ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
			 menu.setCreateBy(activeUser.getUserid());
			 menu.setUpdateDy(activeUser.getUserid());
			 menu.setCreateDate(new Date());
			 menu.setUpdateDate(menu.getCreateDate());
			 menu.setDelFlag("0");
			 menu.setParentIds(menu.getParentIds()+menu.getParentId()+",");
			menuService.saveMenu(menu);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("msg", "保存成功");
		result.put("result", true);
		return result;
	}
	
	
	 
	 
}
