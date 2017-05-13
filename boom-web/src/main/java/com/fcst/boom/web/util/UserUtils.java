package com.fcst.boom.web.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
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
		// 如果没有登录，则返回实例化空的User对象。
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
	
}
