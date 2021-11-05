package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CategoryDao {
    CategoryEntity getCategory(Long id);
    List<CategoryEntity> findAll();
    Integer addCategory(CategoryEntity categoryEntity);
}
