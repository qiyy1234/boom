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

	//规划后的菜单
	public List<Menu> findAllList(Menu menu);

	public List<Menu> findByUserId(Menu menu);

	public Menu detailMenu(String id);
	
	public int saveMenu(Menu menu);

	public void updateMenu(Menu menu);

	public int deleteMenu(String menuId);

	// role 接口 List
	public List<Menu> findAllMenu(Menu menu);
	

}
