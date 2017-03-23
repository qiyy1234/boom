package com.fcst.boom.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fcst.boom.common.Constant;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.domain.Organization;
import com.fcst.boom.service.OrganizationService;
import com.fcst.boom.web.shiro.CustomRealm.Principal;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * 部门管理Controller
 * @author qiyy
 *
 */
@Controller
@RequestMapping("/boom/organization")
public class OrganizationController {
	
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired  
    private HttpServletRequest request;  
	
	/**
	 * 跳转到公司管理
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "/organization";
    }
	
	/**
	 * 查询所有用用
	 * @return
	 */
	@RequestMapping("/allList")
	@ResponseBody
	public JsonResult allList(Organization organization){
		JsonResult result = new JsonResult();
		List<Organization> orgList = null; 
		try {
			orgList = organizationService.findAllOrganizationList(organization);
			if(orgList!=null){
				result.put("zTreeNodes", orgList);
			}else{
				result.put("zTreeNodes", "[]");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				return principal;
			}
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	/**
	 * 查询所有公司
	 * @return
	 */
	@RequestMapping("/treeData")
	@ResponseBody
	public JsonResult treeData(Organization organization, @RequestParam(required=false) String extId, @RequestParam(required=false) String type ,
			@RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response){
		JsonResult result = new JsonResult();
		List<Map<String, Object>> mapList = Lists.newArrayList();
	    List<Organization> list = null; 
		try {
			Principal principal = getPrincipal();
			if (principal.getId().equals("1")){
				 list = organizationService.findAllList(isAll);
				
			} else {
			     list = organizationService.findList(isAll,principal.getId());

			}
			
			for (int i=0; i<list.size(); i++){
				Organization e = list.get(i);
				if ((StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1))
						&& (type == null || (type != null && (type.equals("1") ? type.equals(e.getType()) : true)))
						&& (grade == null || (grade != null && Integer.parseInt(e.getGrade()) <= grade.intValue()))
						&& Constant.YES.equals(e.getUseable())){
					Map<String, Object> map = Maps.newHashMap();
					map.put("id", e.getId());
					map.put("parentId", e.getParentId());
					map.put("parentIds", e.getParentIds());
					map.put("name",  e.getName());
					if (type != null && "3".equals(type)){
						map.put("isParent", true);
					}
					mapList.add(map);
				}
			}
			result.put("zTreeNodes", mapList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(Organization organization){
		JsonResult result = new JsonResult();
		List<Organization> list = new ArrayList<Organization>();
		List<Organization> orgList = null; 
		try {
			orgList = organizationService.findAllOrganizationList(organization);
			Organization.sortList(list, orgList, "1", true);
			String jsonStr=JSON.toJSONString(list);
			
			System.out.println("--- ---  回调函数 -organization--  ---"+jsonStr);
			
			result.put("data", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(String orgId){
		JsonResult result = new JsonResult();
		try {
			int resultVal = organizationService.deleteOrganization(orgId);
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
	
	@RequestMapping("/add")
	@ResponseBody
	public JsonResult add(@RequestBody Organization organization){
		JsonResult result = new JsonResult();
		try {
			organization.setCreateUser("qiyy");
			organization.setCreateDate(new Date());
			
			organizationService.addOrganization(organization);
			
			result.put("msg", "保存成功");
			result.put("result", true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.put("msg", "保存失败");
			result.put("result", false);
		}
		
		return result;
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public JsonResult update(@RequestBody Organization organization){
		JsonResult result = new JsonResult();
		try {
			organization.setUpdateUser("qiyy");
			organization.setUpdateDate(new Date());
			organizationService.updateOrganization(organization);
			result.put("msg", "修改成功");
			result.put("result", true);
		} catch (Exception e) {
			result.put("msg", "修改失败");
			result.put("result", false);
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 查看组织机构详情
	 * @param organization
	 * @return
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public Organization detail(String orgId){
		Organization organization = null;
		try {
			organization = organizationService.detailOrganization(orgId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return organization;
	}

	public OrganizationService getOrganizationService() {
		return organizationService;
	}

	public void setOrganizationService(OrganizationService organizationService) {
		this.organizationService = organizationService;
	}
	
	
	
	
}
