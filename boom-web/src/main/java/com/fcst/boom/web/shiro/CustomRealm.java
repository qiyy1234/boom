package com.fcst.boom.web.shiro;

import java.io.Serializable;
import java.util.ArrayList;
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


public class CustomRealm extends AuthorizingRealm{
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	
	// shiro -realm 设定名称;
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}
	
	// shiro realm的认证方法，从数据库查询用户信息;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		String userCode = (String) token.getPrincipal();
		System.err.println("------realm.do 验证开始----------"+userCode);
		User user=null;
		try {
			user=userService.getUserByUsername(userCode);
			user.setRoleList(roleService.findList(new Role(user)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==user){
			return null;
		}
		String password=user.getPassword();
		//String salt=user.getSalt();
		
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
		
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user, password, this.getName());
		System.err.println("------realm.do 验证结束---------");
		return simpleAuthenticationInfo;
	}
	
	// 授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		System.err.println("------realm.do 授权开始开始---------");
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
				System.err.println("------realm.do 授权---permissionList------"+permission.getName());
				permissions.add(permission.getPercode());
			}
		}
		
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(permissions);
		System.err.println("------realm.do 授权结束结束---------");
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
		private boolean mobileLogin; // 是否手机登录
		
		public Principal(User user, boolean mobileLogin) {
			this.id = user.getId();
			this.loginName = user.getLoginName();
			this.name = user.getName();
			this.mobileLogin = mobileLogin;
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
		
		

    
    
    }
		
    //--------end-------
}
