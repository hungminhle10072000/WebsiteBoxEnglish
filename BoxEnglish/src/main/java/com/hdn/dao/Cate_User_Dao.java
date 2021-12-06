package com.hdn.dao;

import com.hdn.entity.Cate_User_Entity;
import com.hdn.entity.UserEntity;

import java.util.List;

public interface Cate_User_Dao {
	boolean checkCateUser(Long idCourse, UserEntity user);
}
