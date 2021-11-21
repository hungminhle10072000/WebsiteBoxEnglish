package com.hdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	@Override
	public boolean updatePassWord(UserEntity userUpdate) {
		return userimp.updatePassWord(userUpdate);
	}

	@Override
	public UserEntity updateInfoUser(UserEntity user, String fullname, String username, MultipartFile file_image) {
		return userimp.updateInfoUser(user, fullname, username, file_image);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userimp.checkExistUsername(username);
	}
}
