package com.fcst.boom.web.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fcst.boom.common.Constant;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.common.MD5;
import com.fcst.boom.domain.ActiveUser;

@Controller
@RequestMapping("/page")
public class LoginController {
	
	@RequestMapping("/login")
	public String login(){
		System.err.println("------login.do基础-----开始-----");
		Subject currentUser = SecurityUtils.getSubject(); 
		if(currentUser.getPrincipal()!=null){
			System.err.println("------login.do基础---中间 判断 getPrincipal()! 空-----");
			return "redirect:/index.do";
		}
		System.err.println("------login.do基础---中结束间-----");
		return "login";
	}
	
	@RequestMapping("/validateLogin")
	@ResponseBody
	public JsonResult validateLogin( Model model, HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex){
		JsonResult result = new JsonResult();
		System.err.println("------validateLogin.do ----开始------");
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		//获取session中的验证码
		String validateCode = ((String)session.getAttribute(Constant.SESSION_VALIDATE_CODE)).toLowerCase();		
		String randomcode=(request.getParameter("randomcode")).toLowerCase();
		System.out.println("----validateCode-----"+validateCode);
		System.out.println("----randomcode-----"+randomcode);
		String password=request.getParameter("password");
		String loginName=request.getParameter("loginName");
		if(validateCode!=null&&randomcode!=null&&!validateCode.equals(randomcode)){			
			/* ResponseUtils.renderJson(response, backSuccessJson("codeerror", "验证码输入错误"));	*/
		        result.put("codeerror", "codeerror");
		}else{
			//shiro加入身份验证
			System.err.println("------validateLogin.do --ELSE--------");
			Subject subject = SecurityUtils.getSubject(); 
			String passwordMd5=new MD5().getMD5ofStr(password);
		    UsernamePasswordToken token = new UsernamePasswordToken(loginName,password); 
		    try { 
				System.err.println("------validateLogin.do --验证--------");
		        subject.login(token); 
				System.err.println("------validateLogin.do --验证通过--------"+response);
		        // ResponseUtils.renderJson(response, backSuccessJson("success", "登录成功")); 
		        result.put("success", "success");
		    } catch (AuthenticationException e) { 
				System.err.println("------validateLogin.do --验证没有通过--------"+response);
		    	//ResponseUtils.renderJson(response, backSuccessJson("usererror", "用户名或密码错误")); 
		    	result.put("usererror", "usererror");
		    }
		}
		return result;
	    
	}
	
	
	/**
	 * 用户注销
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String doLoginOut(){
		System.err.println("------loginOUT-----销毁-----");
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
		return "login";
	}
	
	@RequestMapping("/index") 
	public String index(Model model){
		System.err.println("------index.do基础-----开始-----");
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		System.err.println("------index.do基础-----开始-----"+activeUser.getMenus().get(0).getSubsetPermission());
		model.addAttribute("activeUser", activeUser);
		System.err.println("------index.do基础-----结束-----");
		return "index";
	}
	
	
/*	*//**
	 * 给man端使用登陆接口
	 *//*
	@RequestMapping("/manLogin.do")
	public void manLogin(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		String password=request.getParameter("password");
		String usernmae=request.getParameter("username");
		Subject subject = SecurityUtils.getSubject(); 
		String passwordMd5=new MD5().getMD5ofStr(password);
	    UsernamePasswordToken token = new UsernamePasswordToken(usernmae,password); 
	    try { 
	        subject.login(token); 
	        ResponseUtils.renderJson(response, backSuccessJson("success", "登录成功")); 
	    } catch (AuthenticationException e) { 
	    	ResponseUtils.renderJson(response, backSuccessJson("usererror", "用户名或密码错误")); 
	    }
	}*/
	
	/**
	 * Code 验证码
	 */
	@RequestMapping("/code")
	public void code(HttpServletResponse response){
		System.err.println("------code.do-----验证码-----");
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String code = drawImg(output);
		
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute(Constant.SESSION_VALIDATE_CODE, code);
		
		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private String drawImg(ByteArrayOutputStream output){
		String code = "";
		for(int i=0; i<4; i++){
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width,height,BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman",Font.PLAIN,20);
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66,2,82);
		g.setColor(color);
		g.setBackground(new Color(226,226,240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int)x, (int)baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}
	
	private char randomChar(){
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}
}
