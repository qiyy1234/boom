package com.fcst.boom.web.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fcst.boom.service.UserService;

/**
 * 用户管理Controller
 * @author qiyy
 *
 */
@Controller
@RequestMapping("/boom/lot")
public class LotController {
	
	@Autowired
	private UserService userService;
	
	@Autowired  
    private HttpServletRequest request;  
	
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "/lot";
    }

	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
