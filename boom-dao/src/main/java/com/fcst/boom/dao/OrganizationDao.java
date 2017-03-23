package com.fcst.boom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fcst.boom.domain.Organization;

public interface OrganizationDao {

	/**
	 * 查询所有机构
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	public List<Organization> getAllOrganizationList(@Param("organization")Organization organization) throws Exception;
	
	
	/**
	 * 添加机构
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	public int addOrganization(Organization organization) throws Exception;
	
	/**
	 * 修改机构
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	public int updateOrganization(Organization organization) throws Exception;
	
	/**
	 * 删除机构
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	public int deleteOrganizationById(String orgId) throws Exception;
	
	/**
	 * 查看机构详情
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	public Organization getOrgById(String orgId) throws Exception;

	/**
	 * 查看机构 数据过滤
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	public List<Organization> findList(Organization organization) throws Exception;

	/**
	 * 查看全部机构
	 * @param organization
	 * @return
	 * @throws Exception
	 */
	public List<Organization> findAllList(Organization organization) throws Exception;
	
	
	
}
