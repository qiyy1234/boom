package com.fcst.boom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.dao.RoleDao;
import com.fcst.boom.domain.Role;
import com.fcst.boom.service.RoleService;

public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;

	@Override
	public PageList<Role> query(Role role,PageArg pageArg) throws Exception {
		PageList<Role> result = roleDao.findList(role,pageArg);
		return result;
	}
	
	@Override
	public int add(Role role) throws Exception {
		return roleDao.addRole(role);
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public Role detailRole(String roleId) throws Exception {
		return roleDao.detailRole(roleId);
	}

	
	
	

}
