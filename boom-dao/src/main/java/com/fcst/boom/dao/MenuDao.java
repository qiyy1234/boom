package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Menu;

public interface MenuDao {
	
	/**
	 * 获得所有菜单
	 * @return
	 */
	public List<Menu> getAllMenuList();

	/**
	 * power 菜单
	 * @return
	 */
	public List<Menu> selectAllMenuListDG(String roleId);

	public int insertMenu(Menu menu);

	public List<Menu> selectFindAllList(Menu menu);

	public List<Menu> selectFindByUserId(Menu menu);

	public Menu getMenuById(String id);

/*	public int updateMenu(Menu menu);*/

	public Menu get(String id);

	public void update(Menu menu);

	public List<Menu> findByParentIdsLike(Menu m);

	public void updateParentIds(Menu e);

	public int delete(String menuId);

	public List<Menu> findAllList(Menu menu);
	
	
}
