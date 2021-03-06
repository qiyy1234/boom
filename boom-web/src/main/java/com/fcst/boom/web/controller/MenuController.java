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
import com.fcst.boom.domain.Menu;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.MenuService;
import com.fcst.boom.service.UserService;
import com.fcst.boom.web.shiro.CustomRealm.Principal;

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
	
	@Autowired
	private UserService userService;

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 进入菜单管理页面
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model , User user) {
		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal)subject.getPrincipal();
		if (principal!=null){
		    user = userService.getUser(principal.getId());
		}
		model.addAttribute("user", user );
	    return "/menu";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(User user){
		JsonResult result = new JsonResult();
		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal)subject.getPrincipal();
		if (principal!=null){
	        user = userService.getUser(principal.getId());
		}
		
		List<Menu> list = new ArrayList<Menu>();
		List<Menu> sourcelist = null;

		if (user.isAdmin()){
				sourcelist = menuService.findAllList(new Menu());
				
				String jsonSt1r=JSON.toJSONString(sourcelist);
				
				System.out.println("--- ---  回调函数 -menu--  ---"+jsonSt1r);
				
			}else{
				Menu menu = new Menu();
				menu.setUserId(user.getId());
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
	public JsonResult powerMenuDG(User user){
		JsonResult result = new JsonResult();
/*		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();*/
		
		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal)subject.getPrincipal();
		if (principal!=null){
	        user = userService.getUser(principal.getId());
		}
		
		List<Menu> sourceList = null;
		 if (user.isAdmin()){
			    sourceList = menuService.findAllList(new Menu());
			}else{
				Menu menu = new Menu();
				menu.setUserId(user.getId());
				sourceList = menuService.findByUserId(menu);
			}
		
		result.put("zTreeNodes", sourceList);
		return result;
	}
	
	@RequestMapping("/saveMenu")
	@ResponseBody
	public JsonResult saveMenu(@RequestBody Menu menu,User user){
		JsonResult result = new JsonResult();
		try {
			// 这里可以写一获取时间与人物的构造方法
	/*		Subject subject = SecurityUtils.getSubject();
			 User user = (User) subject.getPrincipal();*/
			 
			 Subject subject = SecurityUtils.getSubject();
			 Principal principal = (Principal)subject.getPrincipal();
			 if (principal!=null){
			    user = userService.getUser(principal.getId());
			 }
			 menu.setCreateBy(user.getId());
			 menu.setUpdateDy(user.getId());
			 menu.setCreateDate(new Date());
			 menu.setUpdateDate(menu.getCreateDate());
			 menu.setDelFlag("0");
			 menu.setParentIds(menu.getParentIds()+menu.getParentId()+",");
			 
				String jsonSt2r=JSON.toJSONString(menu);
				
			 System.out.println("-------- ---------- ------------"+jsonSt2r);
			 
		  if (user.isAdmin()){
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
	public JsonResult updateMenu(@RequestBody Menu menu, Model model, User user){
		JsonResult result = new JsonResult();
		try {
			// 这里可以写一获取时间与人物的构造方法
/*			Subject subject = SecurityUtils.getSubject();
			User user = (User) subject.getPrincipal();*/
			
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal!=null){
		        user = userService.getUser(principal.getId());
			}
			
			menu.setCreateBy(user.getId());
			menu.setUpdateDy(user.getId());
			menu.setCreateDate(new Date());
			menu.setUpdateDate(menu.getCreateDate());
			menu.setDelFlag("0");
			  if (user.isAdmin()){
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
/*		result.put("msg", "保存成功");
		result.put("result", true);*/
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
	public List<Map<String, Object>> upPowerMenuDG(@RequestParam(required=false) String extId,@RequestParam(required=false) 
	         String isShowHide, HttpServletResponse response, User user) {
/*		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();*/
		
		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal)subject.getPrincipal();
		if (principal!=null){
	        user = userService.getUser(principal.getId());
		}
		
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		List<Menu> list = null;

		 if (user.isAdmin()){
				list = menuService.findAllList(new Menu());
			}else{
				Menu menu = new Menu();
				menu.setUserId(user.getId());
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
