package com.fcst.boom.web.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.fcst.boom.domain.User;
import com.fcst.boom.service.UserService;

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
    private HttpServletRequest request;  
	
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping("/index")
    public String index() {
        return "/user";
    }

	
	/**
	 * 查询所有用用
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public JsonResult list(User user){
		JsonResult result = new JsonResult();
		PageArg pageArg = PageUtils.getPageArg(user.getStart(), user.getLength());
		PageList<User> userList = null; 
		try {
			userList = userService.findUserPageList(user,pageArg);
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
	
	
	@RequestMapping("/add")
	@ResponseBody
	public JsonResult add(@RequestBody User user){
		JsonResult result = new JsonResult();
		try {
			user.setCreateUser("qiyy");
			user.setCreateDate(new Date());
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
