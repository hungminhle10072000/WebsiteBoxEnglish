package com.hdn.dao;
import com.hdn.entity.UserEntity;

public interface UserDao {
	UserEntity GetUser(Long id);
	boolean updatePassWord(UserEntity userUpdate);
}




