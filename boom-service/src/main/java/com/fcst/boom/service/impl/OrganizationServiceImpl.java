package com.fcst.boom.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.dao.OrganizationDao;
import com.fcst.boom.dao.RoleDao;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.Office;
import com.fcst.boom.domain.Organization;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.OrganizationService;
import com.google.common.collect.Lists;

public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private OrganizationDao organizationDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;

	public OrganizationDao getOrganizationDao() {
		return organizationDao;
	}

	public void setOrganizationDao(OrganizationDao organizationDao) {
		this.organizationDao = organizationDao;
	}

	@Override
	public List<Organization> findAllOrganizationList(Organization organization) {
		List<Organization> result = null;
		try {
			result = organizationDao.getAllOrganizationList(organization);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int addOrganization(Organization organization) throws Exception {
		organization.setId(GenerationUUID.getUUID());
		return organizationDao.addOrganization(organization);
	}

	@Override
	public Organization detailOrganization(String orgId) throws Exception {
		return organizationDao.getOrgById(orgId);
	}

	@Override
	public int updateOrganization(Organization organization) throws Exception {
		// TODO Auto-generated method stub
		return organizationDao.updateOrganization(organization);
	}

	@Override
	public int deleteOrganization(String orgId) throws Exception {
		// TODO Auto-generated method stub
		return organizationDao.deleteOrganizationById(orgId);
	}

	@Override
	public List<Organization> findList(Boolean isAll, String id) {
		// TODO Auto-generated method stub
		List<Organization> organizationList = null;
		Organization organization = new Organization();
		User user = new User();
		user = userDao.getUser(id);
		user.setCurrentUser(user);
		user.getCurrentUser().setRoleList(roleDao.findList(new Role()));
		organization.getSqlMap().put("dsf",
				dataScopeFilter(user.getCurrentUser(), "a", ""));
		organization.setCurrentUser(user.getCurrentUser());
		try {
			organizationList = organizationDao.findList(organization);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(" ---- userUtils 3--- " + organizationList);
		return organizationList;
	}

	@Override
	public List<Organization> findAllList(Boolean isAll) {
		// TODO Auto-generated method stub
		List<Organization> organizationList = null;
		try {
			organizationList = organizationDao.findAllList(new Organization());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return organizationList;
	}

	private static String dataScopeFilter(User user, String officeAlias,
			String userAlias) {
		// TODO Auto-generated method stub
		System.out
				.println("------- start 3 ----dataScopeFilter --- 数据范围果壳滤 -- ------"
						+ officeAlias);
		System.out
				.println("------- start 4 ----dataScopeFilter --- 数据范围果壳滤 -- ------"
						+ userAlias);

		StringBuilder sqlString = new StringBuilder();

		// 进行权限过滤，多个角色权限范围之间为或者关系。
		List<String> dataScope = Lists.newArrayList();

		// 超级管理员，跳过权限过滤
		if (!user.isAdmin()) {
			System.out.println("------- dataScopeFilter isAdmin------"
					+ user.getRoleList());
			boolean isDataScopeAll = false;
			for (Role r : user.getRoleList()) {
				System.out.println("------- dataScopeFilter getDataScope------"
						+ r.getDataScope());
				for (String oa : StringUtils.split(officeAlias, ",")) {
					System.out
							.println("------- dataScopeFilter getDataScope oa------"
									+ oa);
					if (!dataScope.contains(r.getDataScope())
							&& StringUtils.isNotBlank(oa)) {
						if (Role.DATA_SCOPE_ALL.equals(r.getDataScope())) {
							isDataScopeAll = true;
						} else if (Role.DATA_SCOPE_COMPANY_AND_CHILD.equals(r
								.getDataScope())) {
							sqlString.append(" OR " + oa + ".id = '"
									+ user.getCompany().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '"
									+ user.getCompany().getParentIds()
									+ user.getCompany().getId() + ",%'");
						} else if (Role.DATA_SCOPE_COMPANY.equals(r
								.getDataScope())) {
							sqlString.append(" OR " + oa + ".id = '"
									+ user.getCompany().getId() + "'");
							// 包括本公司下的部门 （type=1:公司；type=2：部门）
							sqlString.append(" OR (" + oa + ".parent_id = '"
									+ user.getCompany().getId() + "' AND " + oa
									+ ".type = '2')");
						} else if (Role.DATA_SCOPE_OFFICE_AND_CHILD.equals(r
								.getDataScope())) {
							sqlString.append(" OR " + oa + ".id = '"
									+ user.getOffice().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '"
									+ user.getOffice().getParentIds()
									+ user.getOffice().getId() + ",%'");
						} else if (Role.DATA_SCOPE_OFFICE.equals(r
								.getDataScope())) {
							sqlString.append(" OR " + oa + ".id = '"
									+ user.getOffice().getId() + "'");
						} else if (Role.DATA_SCOPE_CUSTOM.equals(r
								.getDataScope())) {
							sqlString
									.append(" OR EXISTS (SELECT 1 FROM sys_role_office WHERE role_id = '"
											+ r.getId() + "'");
							sqlString.append(" AND office_id = " + oa + ".id)");
						}
						// else if
						// (Role.DATA_SCOPE_SELF.equals(r.getDataScope())){
						dataScope.add(r.getDataScope());
						System.out
								.println("------endDataScopeList 第一次拼凑结束-------"
										+ dataScope);

					}
				}
			}
			// 如果没有全部数据权限，并设置了用户别名，则当前权限为本人；如果未设置别名，当前无权限为已植入权限
			if (!isDataScopeAll) {
				System.out.println("--- 第二次拼凑----");
				if (StringUtils.isNotBlank(userAlias)) {
					for (String ua : StringUtils.split(userAlias, ",")) {
						sqlString.append(" OR " + ua + ".id = '" + user.getId()
								+ "'");
					}
				} else {
					for (String oa : StringUtils.split(officeAlias, ",")) {
						sqlString.append(" OR " + oa + ".id IS NULL");
					}
				}
			} else {
				// 如果包含全部权限，则去掉之前添加的所有条件，并跳出循环。
				sqlString = new StringBuilder();
			}
		}
		if (StringUtils.isNotBlank(sqlString.toString())) {
			System.out
					.println("------- ----dataScopeFilter --- 数据范围果壳滤 管理员显示的Thinkgem --------"
							+ sqlString.substring(4));
			return " AND (" + sqlString.substring(4) + ")";
		}
		System.out
				.println("------- end ----dataScopeFilter --- 数据范围果壳滤 -- ------");
		return "";
	}

	@Override
	public List<Office> findAll(User user) {
		// TODO Auto-generated method stub
		List<Office> officeList = null;
		try {
			if (user.isAdmin()) {
				officeList = organizationDao
						.findAllOfficeList(new Office());
			} else {
				Office office = new Office();
				office.getSqlMap().put("dsf",
						dataScopeFilter(user, "a", ""));
				officeList = organizationDao.findOfficeList(office);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return officeList;
	}

}
