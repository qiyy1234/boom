package com.fcst.boom.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.common.mybatis.GenerationUUID;
import com.fcst.boom.common.page.PageArg;
import com.fcst.boom.common.page.PageList;
import com.fcst.boom.dao.UserDao;
import com.fcst.boom.domain.User;
import com.fcst.boom.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public PageList<User> findUserPageList(User user, PageArg pageArg)
			throws Exception {
		return userDao.getUserList(user, pageArg);
	}
	
	@Override
	@Transactional
	public void addUser(User user) throws Exception {
		user.setId(GenerationUUID.getUUID());
		userDao.addUser(user);
		HashMap map =  new HashMap();
		 map.put("userId", user.getId());
		 map.put("roleId", user.getRoleId());
		userDao.addUserRole(map);
	}

	@Override
	public User detailUser(String userId) throws Exception {
		return userDao.getUserById(userId);
	}

	@Override
	public int updateUser(User user) throws Exception {
		return userDao.updateUser(user);
	}
	
	@Override
	public int deleteUser(String userId) throws Exception {
		System.out.println("-- -- --");
		return userDao.deleteUser(userId);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	

}
