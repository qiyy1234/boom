package com.fcst.boom.service;

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
	 public PageList<Role> query(Role role,PageArg pageArg) throws Exception;
	 
	 /**
	  * 添加角色
	  * @param role
	  * @throws Exception
	  */
	 public int add(Role role) throws Exception;
	 
	 /**
	  * 角色详情
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public Role detailRole(String roleId) throws Exception;
}
