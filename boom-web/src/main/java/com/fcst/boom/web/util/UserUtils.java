package com.fcst.boom.web.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.fcst.boom.common.SpringContextHolder;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.User;
import com.fcst.boom.web.shiro.CustomRealm.Principal;

public class UserUtils {

	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);

	public static User getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = userDao.getUser(principal.getId());
			if (user != null){
				return user;
			}
			return new User();
		}
		return new User();
	}
	
	public static Principal getPrincipal() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal;
			}
		} catch (UnavailableSecurityManagerException e) {

		} catch (InvalidSessionException e) {

		}
		return null;
	}
	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
}
