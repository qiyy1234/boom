package com.fcst.boom.service.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.dao.RoleDao;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.RoleService;
import com.google.common.collect.Lists;

public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private UserDao userDao;
	
	public RoleDao getRoleDao() {
		return roleDao;
	}
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public PageList<Role> findRolePageList(Role role ,PageArg pageArg ,String id) throws Exception {
		   User user = new User();
		   user.setId(id);
		   user.setCurrentUser(userDao.getUser(id));
		   List<Role> roleList =null;
		   if (user.isAdmin()){
				roleList = roleDao.findAllRoleList(role ,pageArg);
			}else{
				role.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "u"));
				roleList = roleDao.findRoleList(role ,pageArg);
			}
		
		return (PageList<Role>) roleList;
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
	public List<?> findSelectRoleId()  throws Exception{
		// TODO Auto-generated method stub
		return roleDao.findSelectRoleId();
	}
	
	@Override
	public List<Role> findList(Role role) {
		// TODO Auto-generated method stub
		return roleDao.findList(role);
	}
	
	@Override
	public List<Role> findAllRole(String id) {
		// TODO Auto-generated method stub
	  List<Role> roleList = null;
	    User user = new User();
	    user.setCurrentUser(userDao.getUser(id));
		user.setId(id);
		user.getCurrentUser().setRoleList(roleDao.findList(new Role()));
		user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
	  
	      if (user.isAdmin()){
				roleList = roleDao.findAllList(new Role());
			}else{
				Role role = new Role();
				role.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "u"));
				roleList = roleDao.findList(role);
			}
		return roleList;
	}
	
	private static String dataScopeFilter(User user, String officeAlias, String userAlias) {
		// TODO Auto-generated method stub
		System.out.println("------- start0 ----dataScopeFilter --- 数据范围果壳滤 -- ------"+officeAlias);
		System.out.println("------- start1 ----dataScopeFilter --- 数据范围果壳滤 -- ------"+userAlias);

		StringBuilder sqlString = new StringBuilder();
		
		// 进行权限过滤，多个角色权限范围之间为或者关系。
		List<String> dataScope = Lists.newArrayList();
		
		// 超级管理员，跳过权限过滤
		if (!user.isAdmin()){
			System.out.println("------- dataScopeFilter isAdmin------"+user.getRoleList());
			boolean isDataScopeAll = false;
			for (Role r : user.getRoleList()){
				System.out.println("------- dataScopeFilter getDataScope------"+r.getDataScope());
				for (String oa : StringUtils.split(officeAlias, ",")){
					System.out.println("------- dataScopeFilter getDataScope oa------"+oa);
					if (!dataScope.contains(r.getDataScope()) && StringUtils.isNotBlank(oa)){
						if (Role.DATA_SCOPE_ALL.equals(r.getDataScope())){
							isDataScopeAll = true;
						}
						else if (Role.DATA_SCOPE_COMPANY_AND_CHILD.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getCompany().getParentIds() + user.getCompany().getId() + ",%'");
						}
						else if (Role.DATA_SCOPE_COMPANY.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
							// 包括本公司下的部门 （type=1:公司；type=2：部门）
							sqlString.append(" OR (" + oa + ".parent_id = '" + user.getCompany().getId() + "' AND " + oa + ".type = '2')");
						}
						else if (Role.DATA_SCOPE_OFFICE_AND_CHILD.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getOffice().getParentIds() + user.getOffice().getId() + ",%'");
						}
						else if (Role.DATA_SCOPE_OFFICE.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
						}
						else if (Role.DATA_SCOPE_CUSTOM.equals(r.getDataScope())){
							sqlString.append(" OR EXISTS (SELECT 1 FROM sys_role_office WHERE role_id = '" + r.getId() + "'");
							sqlString.append(" AND office_id = " + oa +".id)");
						}
						//else if (Role.DATA_SCOPE_SELF.equals(r.getDataScope())){
						dataScope.add(r.getDataScope());
						System.out.println("------endDataScopeList 第一次拼凑结束-------"+dataScope);
			
					}
				}
			}
			// 如果没有全部数据权限，并设置了用户别名，则当前权限为本人；如果未设置别名，当前无权限为已植入权限
			if (!isDataScopeAll){
				System.out.println("--- 第二次拼凑----");
				if (StringUtils.isNotBlank(userAlias)){
					for (String ua : StringUtils.split(userAlias, ",")){
						sqlString.append(" OR " + ua + ".id = '" + user.getId() + "'");
					}
				}else {
					for (String oa : StringUtils.split(officeAlias, ",")){
						sqlString.append(" OR " + oa + ".id IS NULL");
					}
				}
			}else{
				// 如果包含全部权限，则去掉之前添加的所有条件，并跳出循环。
				sqlString = new StringBuilder();
			}
		}
		if (StringUtils.isNotBlank(sqlString.toString())){
			System.out.println("------- ----dataScopeFilter --- 数据范围果壳滤 管理员显示的Thinkgem --------"+ sqlString.substring(4) );
			return " AND (" + sqlString.substring(4) + ")";
		}
		System.out.println("------- end ----dataScopeFilter --- 数据范围果壳滤 -- ------");
		return "";
	}
	
	
	
	

}
