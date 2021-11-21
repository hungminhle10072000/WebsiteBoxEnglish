package com.hdn.dao;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.entity.UserEntity;

public interface UserDao {
	UserEntity GetUser(Long id);
	boolean updatePassWord(UserEntity userUpdate);
	UserEntity updateInfoUser(UserEntity user, String fullname, String username, MultipartFile file_image);
	boolean checkExistUsername(String username);
}




