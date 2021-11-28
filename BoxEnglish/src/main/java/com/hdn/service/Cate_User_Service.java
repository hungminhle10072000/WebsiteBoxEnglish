package com.hdn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.Cate_User_Dao;
import com.hdn.daoimp.Cate_User_DaoImp;
import com.hdn.entity.UserEntity;

@Service
public class Cate_User_Service implements Cate_User_Dao{
	
	@Autowired
	Cate_User_DaoImp cate_User_DaoImp;
	
	@Override
	public boolean checkCateUser(Long idCourse, UserEntity user) {
		return cate_User_DaoImp.checkCateUser(idCourse, user);
	}

}
