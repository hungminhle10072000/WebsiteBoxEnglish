package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface CategoryDao extends JpaRepository<CategoryEntity,Long> {
}
