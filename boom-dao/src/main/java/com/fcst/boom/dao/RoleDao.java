package com.fcst.boom.dao;

import org.apache.ibatis.annotations.Param;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.Role;

/**
 * 角色管理Dao
 * @author qiyy
 * 2016-06-26
 * sys_role表Mapper接口
 */
public interface RoleDao {

	/**
	 * 查询所有角色
	 * @return
	 */
	public PageList<Role> findList(Role role,@Param("pageArg")PageArg pageArg);
	
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public int addRole(Role role);
	
	/**
	 * 角色详情
	 * @param id
	 * @return
	 */
	public Role detailRole(String id);
}
