package com.fcst.boom.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 菜单管理controller
 * @author qiyy
 * 2016-06-26
 */
@Controller
@RequestMapping("/boom/menu")
public class MenuController {

	/**
	 * 进入菜单管理页面
	 * @return
	 */
	 @RequestMapping("/index")
	    public String index() {
	        return "/menu";
	 }
	 
	 
}
