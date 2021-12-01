package com.hdn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.CourseDao;
import com.hdn.daoimp.CourseImp;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;

@Service
public class CourseService implements CourseDao{
	
	@Autowired
	private CourseImp courseImp;

	@Override
	public List<CategoryEntity> findAllCourse() {
		return courseImp.findAllCourse();
	}

	@Override
	public boolean AddCourseUser(Long idCourse, UserEntity userEntity) {
		return courseImp.AddCourseUser(idCourse, userEntity);
	}

	@Override
	public boolean deleteCourse(Long idCourse) {
		return courseImp.deleteCourse(idCourse);
	}

	@Override
	public boolean addCourse(UserEntity userEntity, CategoryEntity courseEntity) {
		return courseImp.addCourse(userEntity, courseEntity);
	}

	@Override
	public CategoryEntity findCourseById(Long idCourse) {
		return courseImp.findCourseById(idCourse);
	}

	@Override
	public boolean updateCourse(CategoryEntity courseEntity) {
		return courseImp.updateCourse(courseEntity);
	}
	
}
