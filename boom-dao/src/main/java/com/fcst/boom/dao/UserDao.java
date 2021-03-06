package com.fcst.boom.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.domain.User;

public interface UserDao {
	
	/**
	 * 分页查询所有用户
	 * @param user
	 * @param pageArg
	 * @return
	 * @throws Exception
	 */
	public PageList<User> getUserList(@Param("user") User user ,@Param("pageArg") PageArg pageArg) throws Exception;
	
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

	/**
	 * 添加用户的时候添加权限
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public void addUserRole(HashMap map);

	/**
	 * 根据code查询
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public User getUserByUserByCode(String userCode);

	/**
	 * 根据id-查询用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public User getUser(String id);

	public int deleteUserRole(User user);

	public int insertUserRole(User user);

	public List<User> findList(@Param("user") User user ,@Param("pageArg") PageArg pageArg);

}
