package com.hdn.service;

import com.hdn.converter.ReviewConverter;
import com.hdn.daoimp.ReviewImpl;
import com.hdn.dto.ReviewDto;
import com.hdn.entity.ReviewEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

    @Autowired
    private ReviewImpl reviewImpl;
    @Autowired
    private ReviewConverter reviewConverter;

    public int addReview(ReviewDto reviewDto) {
        ReviewEntity reviewEntity = reviewConverter.toEntity(reviewDto);
        return reviewImpl.addReview(reviewEntity);
    }

    public ReviewEntity getReviewById(Long id) {
        return reviewImpl.getReviewById(id);
    }
}
