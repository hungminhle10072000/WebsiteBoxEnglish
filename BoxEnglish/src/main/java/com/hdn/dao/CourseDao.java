package com.hdn.dao;

import java.util.List;

import com.hdn.entity.Cate_User_Entity;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;

public interface CourseDao {
	
    List<CategoryEntity> findAllCourse();
    boolean AddCourseUser(Long idCourse, UserEntity userEntity);

    
}
