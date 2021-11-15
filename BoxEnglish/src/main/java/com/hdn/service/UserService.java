package com.hdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.UserDao;
import com.hdn.daoimp.UserImp;
import com.hdn.entity.UserEntity;

@Service
public class UserService implements UserDao{
	
	@Autowired
	UserImp userimp;

	public UserEntity GetUser(Long id) {
		// TODO Auto-generated method stub
		return userimp.GetUser(id);
	}
}
