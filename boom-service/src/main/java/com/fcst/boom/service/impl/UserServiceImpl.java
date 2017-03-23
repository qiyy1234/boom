package com.fcst.boom.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.dao.RoleDao;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.UserService;
import com.google.common.collect.Lists;

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	@Transactional
	public void addUser(User user) throws Exception {
		if (StringUtils.isBlank(user.getId())){
		user.setId(GenerationUUID.getUUID());
		userDao.addUser(user);
		}
		if (StringUtils.isNotBlank(user.getId())){
			// 更新用户与角色关联
			userDao.deleteUserRole(user);
			if (user.getRoleList() != null && user.getRoleList().size() > 0){
				userDao.insertUserRole(user);
			}
			// 将当前用户同步到Activiti
	/*		saveActivitiUser(user);*/

		}
		
		
	}

	@Override
	public User detailUser(String userId) throws Exception {
		return userDao.getUserById(userId);
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userDao.updateUser(user);
	}
	
	@Override
	public int deleteUser(String userId) throws Exception {
		System.out.println("-- -- --");
		return userDao.deleteUser(userId);
	}

	@Override
	@Transactional(readOnly=true)
	public User getUserByUsername(String userCode) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserByCode(userCode);
		}

	@Override
	public PageList<User> findList(User user,PageArg pageArg,String id) throws Exception {
		// TODO Auto-generated method stub
	   user.setCurrentUser(userDao.getUser(id));
	   user.setId(id);
	   user.getCurrentUser().setRoleList(roleDao.findList(new Role(user)));
	   user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// 设置分页参数
	   List<User> list = userDao.getUserList(user,pageArg);
		
	return (PageList<User>) list;
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

	@Override
	public List<Role> findAllRole(String id) {
		// TODO Auto-generated method stub
		
		List<Role> roleList = null;
		User user = userDao.getUser(id);
		user.setCurrentUser(user);
		user.getCurrentUser().setRoleList(roleDao.findList(new Role(user)));
		
		if (user.isAdmin()){
			roleList = roleDao.findAllList(new Role());
		}else{
			Role role = new Role();
			role.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "u"));
		    roleList = roleDao.findList(role);
		}

	return roleList;
	}

	@Override
	public PageList<User> findUserPageList(User user, PageArg pageArg)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(String id) {
		// TODO Auto-generated method stub
		User user = userDao.getUser(id);
		user.setCurrentUser(user);
		user.getCurrentUser().setRoleList(roleDao.findList(new Role(user)));
		return user;
	}

	
	
	
	
	
	
	
	
	
	

}
