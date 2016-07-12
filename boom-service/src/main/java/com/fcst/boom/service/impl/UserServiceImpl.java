package com.fcst.boom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

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
	public int addUser(User user) throws Exception {
		user.setId(GenerationUUID.getUUID());
		return userDao.addUser(user);
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
		return userDao.deleteUser(userId);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	

}
