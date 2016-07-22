package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Menu;

public interface MenuService {
	
	/**
	 * 获得所有菜单List
	 * @return
	 */
	public List<Menu> getAllMenuList();

}
