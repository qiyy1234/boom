package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;

public class User extends BaseEntity<User> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1660394325814677848L;

	private String loginName;//用户登录名
	
	private String company_id;//公司ID
	
	private String office_id;//部门ID
	
	private String Username; //用户昵称
	
	private String roleId;   //角色ID
	
	private String password; //密码
	
	private String birthday; //出生年月
	
	private String name;     //姓名
	
	private String sex;      //性别 1为男  0为女
	
	private String email;    //email
	
	private String phone;
	
	private String mobile;
	
	private String loginIp;
	
	private String lastDate; //最后登录时间
	
	private String state;    // 1为在用  0 为不在用
	
	private String photoUrl; //照片路径
	
	private String photoName;//照片名称
	
	private String salt;     //登录后加字段
	
	private String Bz;       //登录后加字段
	
	private String userType;
	
	private String no;
	
	private String delFlag;
	
	private String loginFlag;
	
	private Office company;	// 归属公司
	
	private String companyName;
	
	private Office office;	// 归属部门
	
	private String officeName;
	
	@Autowired
	private Role role;
	
	@Autowired
	private List<String> roleIdList;
	
	private List<String> roleIdLists;
	
	private List<Permission> menus = Lists.newArrayList();//菜单
	
	private List<Permission> permissions = Lists.newArrayList();//权限
	
	private List<Role> roleList = Lists.newArrayList(); // 拥有角色列表
	
	
	public User() {
		super();
		this.loginFlag = BaseEntity.YES;
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	public User(String id){
		super(id);
	}

	public User(String id, String loginName){
		super(id);
		this.loginName = loginName;
	}

	public User(Role role){
		super();
		this.role = role;
	}
	
	@JsonIgnore
	public List<String> getRoleIdList() {
		
		System.out.println("--let me see one roleIdList-");
		
		List<String> roleIdList = Lists.newArrayList();
		for (Role role : roleList) {
			roleIdList.add(role.getId());
		}
		return roleIdList;
	}

	public void setRoleIdList(List<String> roleIdList) {
		
		
		System.out.println("--let me see two roleIdList-");
		
		roleList = Lists.newArrayList();
		for (String roleId : roleIdList) {
			Role role = new Role();
			role.setId(roleId);
			roleList.add(role);
		}
	}
	

	public Office getCompany() {
		return company;
	}

	public void setCompany(Office company) {
		this.company = company;
	}

	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	public String getPhotoName() {
		return photoName;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getBz() {
		return Bz;
	}

	public void setBz(String bz) {
		Bz = bz;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
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

	public boolean isAdmin(){
		return isAdmin(this.id);
	}
	
	public static boolean isAdmin(String userid){
		return userid != null && "1".equals(userid);
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getOffice_id() {
		return office_id;
	}

	public void setOffice_id(String office_id) {
		this.office_id = office_id;
	}

	public List<String> getRoleIdLists() {
		return roleIdLists;
	}

	public void setRoleIdLists(List<String> roleIdLists) {
		this.roleIdLists = roleIdLists;
	}



	

}
