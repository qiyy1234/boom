package com.fcst.boom.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.dao.RoleDao;
import com.fcst.boom.domain.Role;
import com.fcst.boom.service.RoleService;

public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	public RoleDao getRoleDao() {
		return roleDao;
	}
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public PageList<Role> findRolePageList(Role role,PageArg pageArg) throws Exception {
		PageList<Role> result = roleDao.getRoleList(role,pageArg);
		return result;
	}
	
	@Override
	public int addRole(Role role) throws Exception {
		role.setId(GenerationUUID.getUUID());
		return roleDao.addRole(role);
	}

	@Override
	public Role detailRole(String roleId) throws Exception {
		return roleDao.getRoleById(roleId);
	}

	@Override
	public int updateRole(Role role) throws Exception {
		return roleDao.updateRole(role);
	}
	
	@Override
	public int deleteRole(String roleId) throws Exception {
		return roleDao.deleteRole(roleId);
	}

	@Override
	public void deleteRolePermissionByRoleId(String roleId) throws Exception {
		// TODO Auto-generated method stub
		roleDao.deleteRolePermissionByRoleId(roleId);
	}

	@Override
	public void addRolePermission(String roleId, Long permissionId) throws Exception {
		// TODO Auto-generated method stub
		HashMap map=new HashMap();
		map.put("roleId", roleId);
		map.put("permissionId", permissionId);
		roleDao.insertRolePermission(map);
		
	}
	
	@Override
	public List findSelectRoleId()  throws Exception{
		// TODO Auto-generated method stub
		return roleDao.findSelectRoleId();
	}

}
