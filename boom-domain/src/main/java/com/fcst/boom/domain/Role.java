package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import com.google.common.collect.Lists;

public class Role extends BaseEntity<Object> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7336533771042458641L;
	
	private String name; 	    // 角色名称
	private String enname;	    // 英文名称
	private String roleType;    // 权限类型
	private String dataScope;   // 数据范围
	private String oldName; 	// 原角色名称
	private String oldEnname;	// 原英文名称
	private String sysData;     // 是否是系统数据
	private String isSys;       // 是否是系统数据 up
	private String useable;     // 是否是可用
	private String delFlag;     // 是否显示
	private String create_date; // 创建时间
	private String create_user; // 创建人
	private String update_user; // 修改人
	private String update_date; // 修改时间
	private String officeId;    // 部门Id
	private String dataScopeName;//数据过滤名称
	private Organization office;// 归属机构
	private Office officeTest;// 归属机构
	
	private User user;		    // 根据用户ID查询角色列表
	
	public Role(String id){
		super(id);
	}
	public Role() {
		super();
		this.dataScope = DATA_SCOPE_SELF;
		this.useable= DEL_FLAG_DELETE;
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	public Role(User user) {
		this();
		this.user = user;
	}

	private List<Menu> menuList = Lists.newArrayList(); // 拥有菜单列表
	private List<Organization> officeList = Lists.newArrayList(); // 按明细设置数据范围

	// 数据范围（1：所有数据；2：所在公司及以下数据；3：所在公司数据；4：所在部门及以下数据；5：所在部门数据；8：仅本人数据；9：按明细设置）
	public static final String DATA_SCOPE_ALL = "1";
	public static final String DATA_SCOPE_COMPANY_AND_CHILD = "2";
	public static final String DATA_SCOPE_COMPANY = "3";
	public static final String DATA_SCOPE_OFFICE_AND_CHILD = "4";
	public static final String DATA_SCOPE_OFFICE = "5";
	public static final String DATA_SCOPE_SELF = "8";
	public static final String DATA_SCOPE_CUSTOM = "9";
	
	
	public List<String> getMenuIdList() {
		List<String> menuIdList = Lists.newArrayList();
		for (Menu menu : menuList) {
			menuIdList.add(menu.getId());
		}
		return menuIdList;
	}

	public void setMenuIdList(List<String> menuIdList) {
		menuList = Lists.newArrayList();
		for (String menuId : menuIdList) {
			Menu menu = new Menu();
			menu.setId(menuId);
			menuList.add(menu);
		}
	}
	
	public String getMenuIds() {
		return StringUtils.join(getMenuIdList(), ",");
	}
	
	public void setMenuIds(String menuIds) {
		menuList = Lists.newArrayList();
		if (menuIds != null){
			String[] ids = StringUtils.split(menuIds, ",");
			setMenuIdList(Lists.newArrayList(ids));
		}
	}
	
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	public String getDataScope() {
		return dataScope;
	}
	public void setDataScope(String dataScope) {
		this.dataScope = dataScope;
	}
	public String getOldName() {
		return oldName;
	}
	public void setOldName(String oldName) {
		this.oldName = oldName;
	}
	public String getOldEnname() {
		return oldEnname;
	}
	public void setOldEnname(String oldEnname) {
		this.oldEnname = oldEnname;
	}
	public String getSysData() {
		return sysData;
	}
	public void setSysData(String sysData) {
		this.sysData = sysData;
	}
	public String getUseable() {
		return useable;
	}
	public void setUseable(String useable) {
		this.useable = useable;
	}
	public Organization getOffice() {
		return office;
	}
	public void setOffice(Organization office) {
		this.office = office;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	public List<Organization> getOfficeList() {
		return officeList;
	}
	public void setOfficeList(List<Organization> officeList) {
		this.officeList = officeList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getDataScopeName() {
		return dataScopeName;
	}
	public void setDataScopeName(String dataScopeName) {
		this.dataScopeName = dataScopeName;
	}
	public Office getOfficeTest() {
		return officeTest;
	}
	public void setOfficeTest(Office officeTest) {
		this.officeTest = officeTest;
	}
	public String getIsSys() {
		return isSys;
	}
	public void setIsSys(String isSys) {
		this.isSys = isSys;
	}
	

}
