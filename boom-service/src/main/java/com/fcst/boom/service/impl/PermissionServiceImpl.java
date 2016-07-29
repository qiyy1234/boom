package com.fcst.boom.service.impl;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.PermissionDao;
import com.fcst.boom.domain.Permission;
import com.fcst.boom.service.PermissionService;

public class PermissionServiceImpl implements PermissionService {
	
	@Autowired
	private PermissionDao permissionDao;

	@Override
	@Transactional(readOnly=true)
	public List<Permission> getAllPermission(Long roleId) {
		// TODO Auto-generated method stub
		List<Permission> permissionMeunList=permissionDao.selectPermissionByParentid(String.valueOf(1l));
		//  sys_permission WHERE parentid= 1 and  name=系统管理
		List<Permission> myPermissionList=permissionDao.selectPermissionByRoleId(roleId);
		//FROM sys_permission WHERE id in(SELECT sys_permission_id FROM sys_role_permission WHERE sys_role_id=4)
		//系统管理 - 用户管理 - 用户添加                          
		Set<String> set = new HashSet<String>(); 
		for(int i=0;i<myPermissionList.size();i++){
			Permission p=myPermissionList.get(i);
			set.add(p.getId());
		}
		System.out.println(" --- 1 --- "+set.size());
		Iterator<String> it = set.iterator(); 
		while (it.hasNext()) { 
		String str = it.next(); 

		System.out.println(" --- 2 --- "+str); 
		} 
		

		for(Permission permissionMeun:permissionMeunList){
			if(set.contains(permissionMeun.getId())){
				permissionMeun.setChecked(true);
			}else{
				permissionMeun.setChecked(false);
			}
			List<Permission> permissionOneChildList=permissionDao.selectPermissionByParentid(permissionMeun.getId());
			permissionMeun.setSubsetPermission(permissionOneChildList);
			for(Permission permissionChild:permissionOneChildList){
				if(set.contains(permissionChild.getId())){
					permissionChild.setChecked(true);
				}else{
					permissionChild.setChecked(false);
				}
				List<Permission> permissionTwoChildList=permissionDao.selectPermissionByParentid(permissionChild.getId());
				for(Permission permissionTwoChild:permissionTwoChildList){
					if(set.contains(permissionTwoChild.getId())){
						permissionTwoChild.setChecked(true);
					}else{
						permissionTwoChild.setChecked(false);
					}
				}
				permissionChild.setSubsetPermission(permissionTwoChildList);
			}
		}
		return permissionMeunList;
	}
	
	

}
