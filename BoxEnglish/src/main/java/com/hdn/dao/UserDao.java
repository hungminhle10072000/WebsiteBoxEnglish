package com.hdn.dao;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.entity.UserEntity;

public interface UserDao {
	
	UserEntity GetUser(Long id);
	boolean updatePassWord(UserEntity userUpdate);
	UserEntity updateInfoUser(UserEntity user, String fullname, String username, MultipartFile file_image);
	boolean checkExistUsername(String username);
	List<UserEntity> getAllUser();
	boolean deleteUser(Long idUser);
	boolean checkExistEmail(String email);
	boolean addAccount(UserEntity userEntity);
	boolean resetPassWord(UserEntity userUpdate);
	boolean updateAccount(UserEntity userUpdate);
	UserEntity getUserByEmail(String email);
	UserEntity getuserByUserName(String username);
	boolean checkUserNameEmail(String username, String email);
	String sendVali(String email);
	boolean resetPassword(String username, String password);
	
}




