package com.fcst.boom.web.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.common.page.PageUtils;
import com.fcst.boom.domain.Permission;
import com.fcst.boom.domain.Role;
import com.fcst.boom.service.PermissionService;
import com.fcst.boom.service.RoleService;

/**
 * 角色管理controller
 * @author qiyy
 *
 */
@Controller
@RequestMapping("/boom/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 跳转到角色管理页面
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "/role";
    }
	
	/**
	 * doAuthSave 保存权限菜单
	 * @return 
	 */
	
	@RequestMapping("/doAuthSave")
	@RequiresPermissions("role:add")
	public void doAuthSave(String roleId,String ids){
		try {
			
	        roleService.deleteRolePermissionByRoleId(roleId);
		
		String[] idStr=ids.split(",");
		for(int i=0;i<idStr.length;i++){
			roleService.addRolePermission(roleId, Long.parseLong(idStr[i]));
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 跳转权限菜单
	 * @return
	 */
	@RequestMapping("/powerRole")
	@ResponseBody
	public JsonResult powerRole(String roleId){
		JsonResult result = new JsonResult();
		List<Permission> permissionList=permissionService.getAllPermission(roleId);
		String jsonStr=JSON.toJSONString(permissionList);
		jsonStr=jsonStr.replaceAll("subsetPermission", "nodes");
		result.put("zTreeNodes", permissionList);
		result.put("roleId", roleId);
		return result;
	}
	
	
	/**
	 * 查询所有角色
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(Role role){
		JsonResult result = new JsonResult();
		PageArg pageArg = PageUtils.getPageArg(role.getStart(), role.getLength());
		PageList<Role> roleList = null; 
		try {
			roleList = roleService.findRolePageList(role,pageArg);
			if(roleList!=null){
				result.put("data", roleList);
				result.put("recordsTotal", roleList.getTotalRow());
				result.put("recordsFiltered", roleList.getTotalRow());
			}else{
				result.put("data", "[]");
				result.put("recordsTotal", 0);
				result.put("recordsFiltered", 0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 新增角色
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public JsonResult add(@RequestBody Role role){
		JsonResult result = new JsonResult();
		try {
			role.setCreateUser("qiyy");
			role.setCreateDate(new Date());
			roleService.addRole(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("msg", "保存成功");
		result.put("result", true);
		return result;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public JsonResult update(@RequestBody Role role){
		JsonResult result = new JsonResult();
		try {
			role.setUpdateUser("qiyy");
			role.setUpdateDate(new Date());
			roleService.updateRole(role);
			result.put("msg", "修改成功");
			result.put("result", true);
		} catch (Exception e) {
			result.put("msg", "修改失败");
			result.put("result", false);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Role detail(String roleId){
		Role role = null;
		try {
			role = roleService.detailRole(roleId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return role;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(String roleId){
		JsonResult result = new JsonResult();
		try {
			int resultVal = roleService.deleteRole(roleId);
			if(resultVal!=0){
				result.put("msg", "删除成功");
				result.put("result", true);
			}
			
		} catch (Exception e) {
			result.put("msg", "删除失败");
			result.put("result", false);
			e.printStackTrace();
		}
		return result;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public PermissionService getPermissionService() {
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	
	
	

}
