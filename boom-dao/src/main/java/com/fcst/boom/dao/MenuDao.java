package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Menu;

public interface MenuDao {
	
	/**
	 * 获得所有菜单
	 * @return
	 */
	public List<Menu> getAllMenuList();
}
