package com.fcst.boom.dao;

import org.apache.ibatis.annotations.Param;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.Role;
import com.fcst.boom.domain.User;

public interface UserDao {
	
	/**
	 * 分页查询所有用户
	 * @param user
	 * @param pageArg
	 * @return
	 * @throws Exception
	 */
	public PageList<User> getUserList(@Param("user")User user,@Param("pageArg")PageArg pageArg) throws Exception;
	
	/**
	 * 添加用户
	 * @param role
	 * @return
	 */
	public int addUser(User user) throws Exception;
	
	/**
	 * 用户详情
	 * @param id
	 * @return
	 */
	public User getUserById(String id) throws Exception;
	
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int updateUser(User user) throws Exception;
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public int deleteUser(String id) throws Exception;

}
