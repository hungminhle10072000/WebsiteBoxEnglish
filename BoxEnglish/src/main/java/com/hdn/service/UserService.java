package com.hdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.Userimp;
import com.hdn.entity.UserEntity;

@Service
public class UserService implements Userimp{
	
	@Autowired
	UserDao userDao;

	@Override
	public UserEntity GetUser(Long id) {
		return userDao.GetUser(id);
	}
	
}
