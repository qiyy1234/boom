package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.List;

import com.google.common.collect.Lists;

public class ActiveUser extends BaseEntity<Object>  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userid;   //账号ID
	private String usercode; //账号
	private String name;     //用户名称
	private String sceneid;  //用户标示ID
	private Role role;
	
	private List<Permission> menus = Lists.newArrayList();//菜单
	private List<Permission> permissions = Lists.newArrayList();//权限
	private List<Role> roleList = Lists.newArrayList(); // 拥有角色列表(custom用)
	
	public boolean isAdmin(){
		return isAdmin(this.userid);
	}
	
	public static boolean isAdmin(String userid){
		return userid != null && "1".equals(userid);
	}
	
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getSceneid() {
		return sceneid;
	}
	public void setSceneid(String sceneid) {
		this.sceneid = sceneid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Permission> getMenus() {
		return menus;
	}
	public void setMenus(List<Permission> menus) {
		this.menus = menus;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	

	
}
