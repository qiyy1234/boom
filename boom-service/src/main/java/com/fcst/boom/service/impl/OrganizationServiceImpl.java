package com.fcst.boom.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.dao.OrganizationDao;
import com.fcst.boom.domain.Organization;
import com.fcst.boom.domain.Role;
import com.fcst.boom.service.OrganizationService;

public class OrganizationServiceImpl implements OrganizationService {
	
	@Autowired
	private OrganizationDao organizationDao;
	
	

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
	
	

}
