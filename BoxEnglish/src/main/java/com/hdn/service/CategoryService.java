package com.hdn.service;

import com.hdn.converter.CategoryConverter;
import com.hdn.dao.CategoryDao;
import com.hdn.dto.CategoryDto;
import com.hdn.entity.CategoryEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class CategoryService {
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private CategoryConverter categoryConverter;

    public List<CategoryDto> getAllCategories() {
        List<CategoryEntity> categoryEntities = categoryDao.findAll();
        return categoryConverter.toListDto(categoryEntities);
    }

    public CategoryDto addCategory(CategoryDto categoryDto) {
        CategoryEntity categoryEntity = categoryConverter.toEntity(categoryDto);
        CategoryEntity category = categoryDao.save(categoryEntity);
        return categoryConverter.toDto(category);
    }

}
