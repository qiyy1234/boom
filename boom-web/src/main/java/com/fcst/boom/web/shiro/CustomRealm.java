package com.fcst.boom.web.shiro;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.domain.ActiveUser;
import com.fcst.boom.domain.Permission;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.PermissionService;
import com.fcst.boom.service.RoleService;
import com.fcst.boom.service.UserService;
import com.google.common.collect.Lists;

public class CustomRealm extends AuthorizingRealm{
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}
	
	//Shiro realm 的认证方法，从数据库查询用户信息;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		String userCode = (String) token.getPrincipal();
		User user=null;
		try {
			user=userService.getUserByUsername(userCode);
			user.setRoleList(roleService.findList(new Role()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==user){
			return null;
		}
		String password=user.getPassword();
		  ActiveUser activeUser=new ActiveUser();
		  activeUser.setUserid(user.getId());
		  activeUser.setName(user.getName());
		  activeUser.setUsercode(user.getLoginName());
		  activeUser.setSceneid(user.getBz());
		  activeUser.setRoleList(user.getRoleList());
		List<Permission> menus=null;
		try {
			menus=permissionService.getPermissionMenuByUserId(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		activeUser.setMenus(menus);
		user.setMenus(menus);
		
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(new Principal(user), password, this.getName());
		return simpleAuthenticationInfo;
	}
	
	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		ActiveUser activeUser =  (ActiveUser) principals.getPrimaryPrincipal();
		List<Permission> permissionList=null;
		try {
			permissionList=permissionService.getPermissionByUserId(activeUser.getUserid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<String> permissions=new ArrayList<String>();
		if(permissionList!=null){
			for(Permission permission:permissionList){
				permissions.add(permission.getPercode());
			}
		}
		
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(permissions);
		return simpleAuthorizationInfo;
	}
	
	//清除缓存
    public void clearCached() {
			PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
			super.clearCache(principals);
		}
    
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
    
    public static class Principal implements Serializable {
    
      private static final long serialVersionUID = 1L;
		
		private String id;           // 编号
		private String loginName;    // 登录名
		private String name;         // 姓名
		private Date   updateDate;   // 创建时间
		private Date   createDate;   // 修改时间
		private String createUser;   // 创建人
		private boolean mobileLogin; // 是否手机登录
		private List<Permission> menus = Lists.newArrayList(); //菜单集合
		
		public Principal(User user) {
			this.id = user.getId();
			this.loginName = user.getLoginName();
			this.name = user.getName();
			this.menus = user.getMenus();
			this.createDate = new Date(); 
			
		}
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getLoginName() {
			return loginName;
		}
		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public boolean isMobileLogin() {
			return mobileLogin;
		}
		public void setMobileLogin(boolean mobileLogin) {
			this.mobileLogin = mobileLogin;
		}
		public List<Permission> getMenus() {
			return menus;
		}
		public void setMenus(List<Permission> menus) {
			this.menus = menus;
		}
		public Date getUpdateDate() {
			return updateDate;
		}
		public void setUpdateDate(Date updateDate) {
			this.updateDate = updateDate;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public String getCreateUser() {
			return createUser;
		}
		public void setCreateUser(String createUser) {
			this.createUser = createUser;
		}
		
    }
		
    //--------end-------
    
}
