package com.fcst.boom.service;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.User;

public interface UserService {
	
	 /**
	  * 分页查询用户
	  * @param user
	  * @param pageArg
	  * @return
	  * @throws Exception
	  */
	 public PageList<User> findUserPageList(User user,PageArg pageArg) throws Exception;
	 
	 /**
	  * 添加用户
	  * @param role
	  * @throws Exception
	  */
	 public void addUser(User user) throws Exception;
	 
	 /**
	  * 用户详情
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public User detailUser(String userId) throws Exception;
	 
	 /**
	  * 修改用户
	  * @param role
	  * @return
	  * @throws Exception
	  */
	 public int updateUser(User user) throws Exception;
	 
	 /**
	  * 删除用户
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public int deleteUser(String userId) throws Exception;
	 
	 /**
	  * 根据用户名查询
	  * @param roleId
	  * @return
	  * @throws Exception
	  */
	 public User getUserByUsername(String userCode);
	 

}
