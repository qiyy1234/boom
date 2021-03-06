package com.fcst.boom.web.shiro;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
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
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.fcst.boom.domain.Menu;
import com.fcst.boom.domain.Permission;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.MenuService;
import com.fcst.boom.service.PermissionService;
import com.fcst.boom.service.RoleService;
import com.fcst.boom.service.UserService;
import com.fcst.boom.web.util.UserUtils;
import com.google.common.collect.Lists;

public class CustomRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private SessionDAO sessionDAO;

	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		String userCode = (String) token.getPrincipal();
		User user = null;
		try {
			user = userService.getUserByUsername(userCode);
			user.setMenuLists(menuService.getMenuList(user.getId()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user != null) {
			SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(
					new Principal(user), user.getPassword(), this.getName());
			return simpleAuthenticationInfo;
		} else {
			return null;
		}

	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		System.out.println("---------test  @RequiresPermissions---------1 开始----");
		Principal principal = (Principal) getAvailablePrincipal(principals);
		// apache shiro获取所有在线用户
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		if (sessions.size() > 0) {
			if (UserUtils.getSubject().isAuthenticated()) {
				for (Session session : sessions) {
					// 获得session中已经登录用户的名字
					String loginUsername = String.valueOf(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
					// 这里的username也就是当前登录的username
					if (principal.getLoginName().equals(loginUsername)) {
						// 这里就把session清除，
						session.setTimeout(0);
						sessionDAO.delete(session);
					}else{
						// 记住我进来的，并且当前用户已登录，则退出当前用户提示信息。
						UserUtils.getSubject().logout();
						throw new AuthenticationException("msg:账号已在其它地方登录，请重新登录。");
					}
				}
			}
		}

		// 获取当前已登录的用户
		User user = userService.getUserByUsername(principal.getLoginName());
		if (user != null) {
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			List<Menu> list = menuService.getMenuList(principal.getId());
			for (Menu menu : list) {
				if (StringUtils.isNotBlank(menu.getPermission())) {
					// 添加基于Permission的权限信息
					for (String permission : StringUtils.split(
							menu.getPermission(), ",")) {
						info.addStringPermission(permission);
					}
				}
			}
			// 添加用户权限
			info.addStringPermission("user");
			// 添加用户角色信息
			for (Role role : user.getRoleList()) {
				info.addRole(role.getEnname());
			}
			// 更新登录IP和时间
			/* getSystemService().updateUserLoginInfo(user); */
			// 记录登录日志
			/* LogUtils.saveLog(Servlets.getRequest(), "系统登录"); */
			System.out.println("---------test  @RequiresPermissions---------2 结束 ----");
			return info;
		} else {
			return null;
		}

	}

	// 清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject()
				.getPrincipals();
		super.clearCache(principals);
	}

	public static Session getSession() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null) {
				session = subject.getSession();
			}
			if (session != null) {
				return session;
			}
		} catch (InvalidSessionException e) {

		}
		return null;
	}

	public static class Principal implements Serializable {

		private static final long serialVersionUID = 1L;

		private String id;           // 编号
		private String loginName;    // 登录名
		private String name;         // 姓名
		private Date updateDate;     // 创建时间
		private Date createDate;     // 修改时间
		private String createUser;   // 创建人
		private boolean mobileLogin; // 是否手机登录
		private List<Permission> menus = Lists.newArrayList(); // 菜单集合
		private List<Menu> menuLists = Lists.newArrayList();   // 菜单集合

		public Principal(User user) {
			this.id = user.getId();
			this.loginName = user.getLoginName();
			this.name = user.getName();
			this.menus = user.getMenus();
			this.createDate = new Date();
			this.menuLists = user.getMenuLists();

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

		public List<Menu> getMenuLists() {
			return menuLists;
		}

		public void setMenuLists(List<Menu> menuLists) {
			this.menuLists = menuLists;
		}

	}

	// --------end-------

}
