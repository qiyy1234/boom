package com.fcst.boom.web.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fcst.boom.common.DateTools;
import com.fcst.boom.common.JsonResult;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.common.page.PageUtils;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.RoleService;
import com.fcst.boom.service.UserService;
import com.fcst.boom.web.shiro.CustomRealm.Principal;
import com.google.common.collect.Lists;

/**
 * 用户管理Controller
 * @author qiyy
 *
 */
@Controller
@RequestMapping("/boom/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired  
    private HttpServletRequest request;  
	
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping("/index")
    public String index(Model model , @ModelAttribute("user") User user , BindingResult result) {
    /*	Subject subject = SecurityUtils.getSubject();
		user = (User) subject.getPrincipal();
		String id =  user.getId();*/
		Principal principal = getPrincipal();
		if (principal!=null){
		    user = userService.getUser(principal.getId());
		}
		model.addAttribute("user", user);
		model.addAttribute("allRoles", userService.findAllRole(principal.getId()));
        return "/user";
    }
	
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				return principal;
			}
//			subject.logout();
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	/**
	 * selectOfficeId
	 * @return
	 */
	
	@RequestMapping("/selectOfficeId")
	@ResponseBody
	public JsonResult selectOfficeId(User user, Model model){
		JsonResult result = new JsonResult();
		try {
			// 这里会出现数据控制需要 selectOfficeId
			Principal principal = getPrincipal();
			user = userService.getUser(principal.getId());
			if(user!=null){
				result.put("companyId", user.getCompany().getId());
				result.put("officeId", user.getOffice().getId());
				result.put("companyName", user.getCompany().getName());
				result.put("officeName", user.getOffice().getName());
			}else{
				result.put("data", "[]");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	/**
	 * 查询所有用用
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(User user, Model model){
		JsonResult result = new JsonResult();
		PageArg pageArg = PageUtils.getPageArg(user.getStart(), user.getLength());
		PageList<User> userList = null; 
		try {
			// 这里会出现数据控制需要sql根据 role datascope 进行数据控制 ...
			Principal principal = getPrincipal();
			userList = userService.findList(user,pageArg,principal.getId());
			if(userList!=null){
				result.put("data", userList);
				result.put("recordsTotal", userList.getTotalRow());
				result.put("recordsFiltered", userList.getTotalRow());
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
	 * 删除用户
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(String userId){
		JsonResult result = new JsonResult();
		try {
			int resultVal = userService.deleteUser(userId);
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
	
	/**
	 * 修改用户
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public JsonResult update(@RequestBody User user){
		JsonResult result = new JsonResult();
		try {
			user.setUpdateUser("qiyy");
			user.setUpdateDate(new Date());
			userService.updateUser(user);
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
	 * 上传附件
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public JsonResult upload(@RequestParam(value = "file", required = false) MultipartFile file){
		JsonResult result = new JsonResult();
		 
	    String fileName = file.getOriginalFilename();  
	    // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
            	String timestamp = DateTools.getDateStr(DateTools.COMMON_DATE_FORMAT_TRIM);
                // 文件保存路径  
                String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/fileupload/" +
                		timestamp + file.getOriginalFilename();  
                String photoName = timestamp + file.getOriginalFilename();
                // 转存文件  
                System.out.println("----------------filePath："+filePath);
                
                SaveFileFromInputStream(file.getInputStream(),filePath);
                result.put("result", true);
        	    result.put("msg", "上传成功");
        	    result.put("filePath", filePath);
        	    result.put("photoName", photoName);
            } catch (Exception e) {  
                e.printStackTrace();  
                result.put("result", false);
        	    result.put("msg", "上传失败");
            }  
        } 
	    System.out.println("------------------文件名："+fileName);
	    
		return result;
	}
	
	/**
	 * 根据ID查询用用
	 * @return
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public User detail(String userId){
		User user = null;
		try {
			user = userService.detailUser(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public void SaveFileFromInputStream(InputStream stream,String filepath) throws IOException
	{      
	       FileOutputStream fs=new FileOutputStream( filepath);
	       System.out.println("------------"+filepath);
	       byte[] buffer =new byte[1024*1024];
	       int bytesum = 0;
	       int byteread = 0; 
	       while ((byteread=stream.read(buffer))!=-1)
	       {
	          bytesum+=byteread;
	          fs.write(buffer,0,byteread);
	          fs.flush();
	       } 
	       fs.close();
	       stream.close();      
	}       
	
	@RequestMapping("/isExistLoginName")
	@ResponseBody
	public JsonResult isExistLoginName(String loginName){
		System.out.println("-----------------------验证登录名："+loginName);
		JsonResult result = new JsonResult();
		//TODO 去数据库查询
		result.put("valid", true);//true为验证通过
		return result;
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public JsonResult add(@RequestBody User user, HttpServletRequest request, Model model){
		JsonResult result = new JsonResult();
		try {
			Principal principal = getPrincipal();
			user.setCreateUser("qiyy");
			user.setCreateDate(new Date());
			user.setDelFlag("0");
			
			// 角色数据有效性验证，过滤不在授权内的角色
			List<Role> roleList = Lists.newArrayList();
			List<String> roleIdList = user.getRoleIdLists();
			for (Role r : roleService.findAllRole(principal.getId())){
				if (roleIdList.contains(r.getId())){
					roleList.add(r);
				}
			}
			user.setRoleList(roleList);
			userService.addUser(user);
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


	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
