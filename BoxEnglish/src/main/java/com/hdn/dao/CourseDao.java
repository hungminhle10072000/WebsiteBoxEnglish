package com.hdn.dao;

import java.util.List;

import com.hdn.entity.CategoryEntity;

public interface CourseDao {
    List<CategoryEntity> findAllCourse();
}
