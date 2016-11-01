package com.fcst.boom.service.impl;

import java.security.Principal;
import java.util.List;

import javax.security.auth.Subject;

import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.dao.MenuDao;
import com.fcst.boom.domain.ActiveUser;
import com.fcst.boom.domain.Menu;
import com.fcst.boom.service.MenuService;

public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;
	
	public MenuDao getMenuDao() {
		return menuDao;
	}
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
	
	/**
	 * 获取当前用户
	 * ActiveUser activeUser
	 * @return 取不到返回 new User()
	 */
	
/*	public static ActiveUser getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = get(principal.getId());
			if (user != null){
				return user;
			}
			return new User();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}
	
	
	
	*//**
	 * 获取当前登录者对象
	 *//*
	public static Principal getPrincipal(){
		System.out.println("-- - - 获取当前对象 - -1-");
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				System.out.println("-- - - 获取当前对象 - -2-");
				return principal;
			}
//			subject.logout();
			System.out.println("-- - - 获取当前对象 - -3-");
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}*/
	
	
	
	@Override
	public List<Menu> getAllMenuList() {
		
		return menuDao.getAllMenuList();
	}
	@Override
	public List<Menu> getAllMenuListDG(String roleId) {
		// TODO Auto-generated method stub
		System.out.println("-----------menu" + roleId);
		return menuDao.selectAllMenuListDG(roleId);
	}
	@Override
	public int saveMenu(Menu menu) {
		// TODO Auto-generated method stub
		menu.setId(GenerationUUID.getUUID());
		return menuDao.insertMenu(menu);
	}
	
	@Override
	public List<Menu> findAllList(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.selectFindAllList(menu);
	}
	@Override
	public List<Menu> findByUserId(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.selectFindByUserId(menu);
	}
	
	

}
