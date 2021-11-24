package com.hdn.dao;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.ReviewEntity;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface ReviewDao {
    Integer addReview(ReviewEntity reviewEntity);
    ReviewEntity getReviewById(Long id);
    List<ReviewEntity> getReviewsByUserIdAndLevel(Long userId,int level);
    List<ReviewEntity> getReviewsByUserIdAndStatus(Long userId,int status);
    ReviewEntity getReviewEntityLatest(Long userId);
    Integer updateReview(ReviewEntity reviewEntity);
}
