package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.ReviewEntity;

import javax.persistence.criteria.CriteriaBuilder;

public interface ReviewDao {
    Integer addReview(ReviewEntity reviewEntity);
    ReviewEntity getReviewById(Long id);
}
