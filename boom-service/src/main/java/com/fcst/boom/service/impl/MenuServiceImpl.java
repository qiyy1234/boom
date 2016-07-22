package com.fcst.boom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.dao.MenuDao;
import com.fcst.boom.domain.Menu;
import com.fcst.boom.service.MenuService;

public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;

	@Override
	public List<Menu> getAllMenuList() {
		return menuDao.getAllMenuList();
	}

	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
	
	

}
