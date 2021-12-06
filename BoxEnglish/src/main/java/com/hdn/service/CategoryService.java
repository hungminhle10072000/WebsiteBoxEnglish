package com.hdn.service;

import com.hdn.converter.CategoryConverter;
import com.hdn.dao.CategoryDao;
import com.hdn.daoimp.CategoryImp;
import com.hdn.dto.CategoryDto;
import com.hdn.entity.CategoryEntity;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService {

	@Autowired
    private CategoryDao categoryDao;
	
	@Autowired
	private CategoryImp categoryImp;

    @Autowired
    private CategoryConverter categoryConverter;


    public CategoryDto getCategory(Long id) {
        CategoryEntity category = categoryDao.getCategory(id);
        return categoryConverter.toDto(category);
    }

    public List<CategoryDto> getAllCategories() {
        List<CategoryEntity> categoryEntities = categoryDao.findAll();
        return categoryConverter.toListDto(categoryEntities);
    }

    public CategoryDto addCategory(CategoryDto categoryDto) {
        CategoryEntity categoryEntity = categoryConverter.toEntity(categoryDto);
        Integer categoryId = categoryDao.addCategory(categoryEntity);
        CategoryDto category = getCategory((Long.parseLong(categoryId.toString())));
        return category;
    }

    public List<CategoryDto> findCourseByUserId(Long userId) {
        List<CategoryEntity> categoryEntities = categoryImp.findCourseByUserId(userId);
        return categoryConverter.toListDto(categoryEntities);
    }
    
}
