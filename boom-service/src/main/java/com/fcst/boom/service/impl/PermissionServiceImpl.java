package com.fcst.boom.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
	public List<Permission> getAllPermission(String roleId) {
		// TODO Auto-generated method stub
		List<Permission> permissionMeunList=permissionDao.selectPermissionByParentid(String.valueOf(1l));
		//  sys_permission WHERE parentid= 9  and  name=系统管理
		//  sys_permission WHERE parentid= 12 and  name=在线办公
		List<Permission> myPermissionList=permissionDao.selectPermissionByRoleId(roleId);
		//  FROM sys_permission WHERE id in(SELECT sys_permission_id FROM sys_role_permission WHERE sys_role_id=4)
		//  根据我前台传过来的       roleId  知道该员工拥有什么角色       （ztree 显示的是已经选中）        上下文都用
		Set<String> set = new HashSet<String>(); 
		for(int i=0;i<myPermissionList.size();i++){
			Permission p=myPermissionList.get(i);
			set.add(p.getId());
		}
		
		//循环1层2个值  9/12
		for(Permission permissionMeun:permissionMeunList){    
			if(set.contains(permissionMeun.getId())){
				permissionMeun.setChecked(true);
			}else{
				permissionMeun.setChecked(false);
			}
			// 9/12的子节点出现了   9/2,6  12/13,14
			List<Permission> permissionOneChildList=permissionDao.selectPermissionByParentid(permissionMeun.getId()); 
			permissionMeun.setSubsetPermission(permissionOneChildList);
			
			for(Permission permissionChild:permissionOneChildList){
				if(set.contains(permissionChild.getId())){
					permissionChild.setChecked(true);
				}else{
					permissionChild.setChecked(false);
				}
				//用户管理下面有三个  add update delete
				List<Permission> permissionTwoChildList=permissionDao.selectPermissionByParentid(permissionChild.getId());
				
				for(Permission permissionTwoChild:permissionTwoChildList){
					if(set.contains(permissionTwoChild.getId())){
						permissionTwoChild.setChecked(true);
					}else{
						permissionTwoChild.setChecked(false);
					}
				}
				permissionChild.setSubsetPermission(permissionTwoChildList);
				
				//----------start top add update delete already put in two 
				for(Permission permissionChildAgin:permissionTwoChildList){
					if(set.contains(permissionChildAgin.getId())){
						permissionChildAgin.setChecked(true);
					}else{
						permissionChildAgin.setChecked(false);
					}
					List<Permission> permissionTwoChildAginList=permissionDao.selectPermissionByParentid(permissionChildAgin.getId());
					for(Permission permissionThreeChild:permissionTwoChildAginList){
						if(set.contains(permissionThreeChild.getId())){
							permissionThreeChild.setChecked(true);
						}else{
							permissionThreeChild.setChecked(false);
						}
					}
					permissionChildAgin.setSubsetPermission(permissionTwoChildAginList);
					
					
				}
				//---------- end 
				
			}
			
		}
		return permissionMeunList;
	}
	
	
	@Override
	@Transactional(readOnly=true)
	public List<Permission> getPermissionMenuByUserId(String userid) {
		// TODO Auto-generated method stub
		List<Permission> permissionList=permissionDao.selectPermissionMenuByUserId(userid);
		for(Permission p:permissionList){	
			HashMap map=new HashMap();
			map.put("parentid", p.getId());
			map.put("userid", userid);
			p.setSubsetPermission(permissionDao.selectPermissionByParentidNotOne(map));
		}
		return permissionDao.selectPermissionMenuByUserId(userid);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Permission> getPermissionByUserId(String userid) {

			return permissionDao.selectPermissionByUserId(userid);
		}


	@Override
	public List<Permission> getAllMenuListDG() {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		return permissionDao.selectPermissionAllMenuListDG(map);
	}


	@Override
	public List<Permission> getMyPermissionListDG(String roleId) {
		// TODO Auto-generated method stub
		return permissionDao.selectPermissionByRoleId(roleId);
	}
	
	

}
