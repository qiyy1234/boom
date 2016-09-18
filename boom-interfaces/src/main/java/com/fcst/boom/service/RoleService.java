package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.Role;

public interface RoleService {

	/**
	 * 查询所有角色
	 * @param role
	 * @return
	 * @throws Exception
	 */
	 public PageList<Role> findRolePageList(Role role,PageArg pageArg) throws Exception;
	 
	 /**
	  * 添加角色
	  * @param role
	  * @throws Exception
	  */
	 public int addRole(Role role) throws Exception;
	 
	 /**
	  * 角色详情
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public Role detailRole(String roleId) throws Exception;
	 
	 /**
	  * 修改角色
	  * @param role
	  * @return
	  * @throws Exception
	  */
	 public int updateRole(Role role) throws Exception;
	 
	 /**
	  * 删除角色
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public int deleteRole(String roleId) throws Exception;

	 /**
	  * 增加权限的时候（之前） 是走删除的逻辑
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	public void deleteRolePermissionByRoleId(String roleId) throws Exception;
	
	 /**
	  * 增加权限菜单
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	public void addRolePermission(String roleId, Long permissionId) throws Exception;
	
	 /**
	  * select列表
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	public List findSelectRoleId() throws Exception;
	
	
	
	
	
}
