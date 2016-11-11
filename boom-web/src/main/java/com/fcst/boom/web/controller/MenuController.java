package com.fcst.boom.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			 
		  if (activeUser.isAdmin()){
			menuService.saveMenu(menu);
			result.put("msg", "保存成功");
			result.put("result", true);
			}else{
				result.put("msg", "越权操作,只有超级管理员才能添加或修改数据!");
				result.put("result", false);
				
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/updateMenu")
	@ResponseBody
	public JsonResult updateMenu(@RequestBody Menu menu, Model model){
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
			  if (activeUser.isAdmin()){
					menuService.updateMenu(menu);
					result.put("msg", "修改成功");
					result.put("result", true);
					}else{
						result.put("msg", "越权操作,只有超级管理员才能添加或修改数据!");
						result.put("result", false);
						
					}		
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("msg", "保存成功");
		result.put("result", true);
		return result;
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Menu detail(String id){
		Menu menu = null;
		try {
			menu = menuService.detailMenu(id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu;
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(String menuId){
		JsonResult result = new JsonResult();
		try {
			int resultVal = menuService.deleteMenu(menuId);
			if(resultVal!=0){
				result.put("msg", "删除成功");
				result.put("result", true);
			}
			
		} catch (Exception e) {
			result.put("msg", "删除失败");
			result.put("result", false);
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	/**
	 * isShowHide是否显示隐藏菜单
	 * @param extId
	 * @param isShowHidden
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "upPowerMenuDG")
	@ResponseBody
	public List<Map<String, Object>> upPowerMenuDG(@RequestParam(required=false) String extId,@RequestParam(required=false) String isShowHide, HttpServletResponse response) {
		System.out.println("--- 1 --- boom---"+extId);
		System.out.println("--- 1 --- boom---"+isShowHide);
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		List<Menu> list = null;

		 if (activeUser.isAdmin()){
				list = menuService.findAllList(new Menu());
			}else{
				Menu menu = new Menu();
				menu.setUserId(activeUser.getUserid());
				list = menuService.findByUserId(menu);
			}		
		
		for (int i=0; i<list.size(); i++){
			Menu e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1 )){
				if(isShowHide != null && isShowHide.equals("0") && e.getIsShow().equals("0")){
					continue;
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", e.getId());
				map.put("pId", e.getpId());
				map.put("name", e.getName());
				map.put("parentIds", e.getParentIds());
				mapList.add(map);
		  }
		}
		
		return mapList;
	}
	
	 
	 
}
