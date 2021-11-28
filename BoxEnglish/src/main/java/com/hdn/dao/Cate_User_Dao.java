package com.hdn.dao;

import com.hdn.entity.UserEntity;

public interface Cate_User_Dao {
	boolean checkCateUser(Long idCourse, UserEntity user);
}
