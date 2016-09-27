package com.fcst.boom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fcst.boom.domain.Permission;

/**
 * 角色管理Dao
 * @author qiyy
 * 2016-06-26
 * sys_role表Mapper接口
 */
public interface PermissionDao {

	// impl递归与逻辑 - 公共方法
	public List<Permission> selectPermissionByRoleId(String roleId);

	public List<Permission> selectPermissionByParentid(String parentid);

	//shiro one
	public List<Permission> selectPermissionMenuByUserId(String userid);
	//shiro two
	public List<Permission> selectPermissionByParentidNotOne(HashMap map);

	public List<Permission> selectPermissionByUserId(String userid);

	//java 递归菜单
	public List<Permission> selectPermissionAllMenuListDG(Map map);

}
