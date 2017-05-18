package com.fcst.boom.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.dao.MenuDao;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.Menu;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.MenuService;

public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;

	@Autowired
	private UserDao userDao;

	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public List<Menu> getAllMenuList() {

		return menuDao.getAllMenuList();
	}

	@Override
	public List<Menu> getAllMenuListDG(String roleId) {
		// TODO Auto-generated method stub
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

	@Override
	public Menu detailMenu(String id) {
		// TODO Auto-generated method stub
		Menu menu = menuDao.getMenuById(id);

		return menu;
	}

	@Override
	public void updateMenu(Menu menu) {
		// TODO Auto-generated method stub

		// 获取父节点实体
		menu.setParent(this.getMenu(menu.getpId()));

		// 获取修改前的parentIds，用于更新子节点的parentIds
		String oldParentIds = menu.getParentIds();

		// 设置新的父节点串
		menu.setParentIds(menu.getParent().getParentIds()
				+ menu.getParent().getId() + ",");

		// 保存或更新实体
		menuDao.update(menu);

		// 更新子节点 parentIds
		Menu m = new Menu();
		m.setParentIds("%," + menu.getId() + ",%");
		List<Menu> list = menuDao.findByParentIdsLike(m);
		for (Menu e : list) {
			e.setParentIds(e.getParentIds().replace(oldParentIds,
					menu.getParentIds()));
			menuDao.updateParentIds(e);
		}

	}

	public Menu getMenu(String id) {
		return menuDao.get(id);
	}

	@Override
	public int deleteMenu(String menuId) {
		// TODO Auto-generated method stub
		return menuDao.delete(menuId);
	}

	@Override
	public List<Menu> findAllMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.findAllList(new Menu());
	}

	@Override
	public List<Menu> findByUserIdMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.findByUserMenuId(menu);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Menu> getMenuList(String id) {
		// TODO Auto-generated method stub
		List<Menu> menuList = null;
		User user = userDao.getUser(id);
		if (user.isAdmin()) {
			menuList = menuDao.findPermissionMenuAllList(new Menu());
			for (Menu p : menuList) {
				HashMap map = new HashMap();
				map.put("parentId", p.getId());
				map.put("userId", id);
				p.setSubsetPermission(menuDao
						.selectPermissionByParentidNotOne(map));
			}
		} else {
			menuList = menuDao.findByPermissionMenuId(user.getId());
			for (Menu p : menuList) {
				HashMap map = new HashMap();
				map.put("parentId", p.getId());
				map.put("userId", id);
				p.setSubsetPermission(menuDao
						.selectPermissionByParentidNotOne(map));
			}
		}
		return menuList;
	}

	@Override
	public List<Menu> findAllMenu(User user) {
		// TODO Auto-generated method stub
		List<Menu> menuList = null;
		if (user.isAdmin()) {
			menuList = menuDao.findAllList(new Menu());
		} else {
			Menu menu = new Menu();
			menu.setUserId(user.getId());
			menuList = menuDao.findByUserId(menu);
		}
		return menuList;
	}

}
