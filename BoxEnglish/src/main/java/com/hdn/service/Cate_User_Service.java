package com.hdn.service;

import com.hdn.converter.CategoryConverter;
import com.hdn.dto.CategoryDto;
import com.hdn.entity.Cate_User_Entity;
import com.hdn.entity.CategoryEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.Cate_User_Dao;
import com.hdn.daoimp.Cate_User_DaoImp;
import com.hdn.entity.UserEntity;

import java.util.ArrayList;
import java.util.List;

@Service
public class Cate_User_Service implements Cate_User_Dao{
	
	@Autowired
	Cate_User_DaoImp cate_User_DaoImp;
	@Autowired
	private CategoryConverter categoryConverter;
	@Override
	public boolean checkCateUser(Long idCourse, UserEntity user) {
		return cate_User_DaoImp.checkCateUser(idCourse, user);
	}

	public List<CategoryDto> findCourseByUserId(Long userId) {
		List<Cate_User_Entity> cate_user_entities = cate_User_DaoImp.findCourseByUserId(userId);
		List<CategoryEntity> categoryEntities = new ArrayList<>();
		for(Cate_User_Entity cate_user_entity: cate_user_entities) {
			categoryEntities.add(cate_user_entity.getCategoryEntity());
		}
		return categoryConverter.toListDto(categoryEntities);
	}
}
