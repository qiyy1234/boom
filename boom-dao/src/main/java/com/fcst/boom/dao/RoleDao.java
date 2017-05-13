package com.fcst.boom.dao;

import java.util.HashMap;
import java.util.List;
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
	public PageList<Role> getRoleList(@Param("role")Role role,@Param("pageArg")PageArg pageArg) throws Exception;
	
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public int addRole(Role role) throws Exception;
	
	/**
	 * 角色详情
	 * @param id
	 * @return
	 */
	public Role getRoleById(String id) throws Exception;
	
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	public int updateRole(Role role) throws Exception;
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public int deleteRole(String id) throws Exception;
	
	/**
	 * 删除权限菜单Id
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public void deleteRolePermissionByRoleId(String roleId) throws Exception;

	/**
	 * 新增权限菜单Id
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public void insertRolePermission(HashMap map) throws Exception;

	/**
	 * select
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List findSelectRoleId() throws Exception;
	
	/**
	 * select
	 * @param user 与 role 的共用体
	 * -Custom 中调用 findList
	 * @return list
	 * @throws Exception
	 */
	public List<Role> findList(@Param("role")Role role);
	
	/**
	 * select
	 * @param user 与 role 的共用体
	 * -Custom 中调用 findList
	 * @return list
	 * @throws Exception
	 */
	public List<Role> findRoleList(@Param("role")Role role,@Param("pageArg")PageArg pageArg);
	
	/**
	 * select
	 * @param user 与 role 的共用体
	 * -Custom 中调用 findAllList
	 * @return list
	 * @throws Exception
	 */
	public List<Role> findAllList(@Param("role")Role role);

	/**
	 * select
	 * @param user 与 role 的共用体
	 * -Custom 中调用 findAllList
	 * @return list
	 * @throws Exception
	 */
	public List<Role> findAllRoleList(@Param("role")Role role,@Param("pageArg")PageArg pageArg);

	/**
	 * select
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<?> findSelectDataScope();

	public void deleteRoleMenu(Role role);

	public void insertRoleMenu(Role role);

	public Role findRole(String id);

	public List<Role> findUserRoleList(String roleId);

	public Integer addUserRole(@Param(value = "userId")String userId ,@Param(value = "roleId")String roleId);

	public void deleteUserRole(String userId);

	public List<Role> findPrepareList(@Param("role")Role role);

	
	
}
