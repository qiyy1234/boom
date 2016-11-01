package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Menu;

public interface MenuService {
	
	/**
	 * 获得所有菜单List
	 * @return
	 */
	public List<Menu> getAllMenuList();

	public List<Menu> getAllMenuListDG(String roleId);

	public int saveMenu(Menu menu);

	
	//规划后的菜单
	public List<Menu> findAllList(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	

}
