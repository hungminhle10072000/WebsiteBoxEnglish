package com.hdn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdn.dao.CourseDao;
import com.hdn.daoimp.CourseImp;
import com.hdn.entity.CategoryEntity;

@Service
public class CourseService implements CourseDao{
	
	@Autowired
	private CourseImp courseImp;

	@Override
	public List<CategoryEntity> findAllCourse() {
		return courseImp.findAllCourse();
	}

}
