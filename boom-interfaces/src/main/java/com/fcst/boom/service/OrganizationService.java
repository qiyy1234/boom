package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.Organization;
import com.fcst.boom.domain.Role;

public interface OrganizationService {

	/**
	 * 查询所有组织机构
	 * @param role
	 * @return
	 * @throws Exception
	 */
	 public List<Organization> findAllOrganizationList(Organization organization) throws Exception;
	 
	 /**
	  * 添加机构
	  * @param role
	  * @throws Exception
	  */
	 public int addOrganization(Organization organization) throws Exception;
	 
	 /**
	  * 机构详情
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public Organization detailOrganization(String orgId) throws Exception;
	 
	 /**
	  * 修改机构
	  * @param role
	  * @return
	  * @throws Exception
	  */
	 public int updateOrganization(Organization organization) throws Exception;
	 
	 /**
	  * 删除机构
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public int deleteOrganization(String orgId) throws Exception;
	 
	 /**
	  * 查询全部公司
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public List<Organization> findAllList(Boolean isAll );

	 /**
	  * 查询过滤公司
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public List<Organization> findList(Boolean isAll ,String id);


	
	
	
}
