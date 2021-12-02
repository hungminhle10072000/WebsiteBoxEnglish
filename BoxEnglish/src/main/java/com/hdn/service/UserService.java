package com.hdn.service;

import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;
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

	@Override
	public List<UserEntity> getAllUser() {
		return userimp.getAllUser();
	}

	@Override
	public boolean deleteUser(Long idUser) {
		return userimp.deleteUser(idUser);
	}

	@Override
	public boolean checkExistEmail(String email) {
		return userimp.checkExistEmail(email);
	}

	@Override
	public boolean addAccount(UserEntity userEntity) {
		return userimp.addAccount(userEntity);
	}

	@Override
	public boolean resetPassWord(UserEntity userUpdate) {
		return userimp.resetPassWord(userUpdate);
	}

	@Override
	public boolean updateAccount(UserEntity userUpdate) {
		// TODO Auto-generated method stub
		return userimp.updateAccount(userUpdate);
	}

	@Override
	public UserEntity getUserByEmail(String email) {
		return userimp.getUserByEmail(email);
	}

	@Override
	public UserEntity getuserByUserName(String username) {
		// TODO Auto-generated method stub
		return userimp.getuserByUserName(username);
	}

	@Override
	public boolean checkUserNameEmail(String username, String email) {
		// TODO Auto-generated method stub
		return userimp.checkUserNameEmail(username, email);
	}

	@Override
	public String sendVali(String email) {
		// TODO Auto-generated method stub
		return userimp.sendVali(email);
	}

	@Override
	public boolean resetPassword(String username, String password) {
		// TODO Auto-generated method stub
		return userimp.resetPassword(username, password);
	}

}
