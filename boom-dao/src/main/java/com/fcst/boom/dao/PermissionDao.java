package com.fcst.boom.dao;

import java.util.List;

import com.fcst.boom.domain.Permission;

/**
 * 角色管理Dao
 * @author qiyy
 * 2016-06-26
 * sys_role表Mapper接口
 */
public interface PermissionDao {

	public List<Permission> selectPermissionByRoleId(Long roleId);

	public List<Permission> selectPermissionByParentid(String parentid);

}
