package com.fcst.boom.web.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fcst.boom.common.JsonResult;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.common.page.PageUtils;
import com.fcst.boom.domain.Role;
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
	
	/**
	 * 跳转到角色管理页面
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "/role";
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
			roleList = roleService.query(role,pageArg);
			if(roleList!=null){
				System.out.println("-----------------controller总数："+roleList.getTotalRow());
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
	
	@RequestMapping("/add")
	@ResponseBody
	public JsonResult add(@RequestBody Role role){
		JsonResult result = new JsonResult();
		try {
			role.setId("222");
			role.setCreateBy("qiyy");
			role.setCreateDate(new Date());
			roleService.add(role);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		result.put("msg", "保存成功");
		result.put("result", true);
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

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	

}
