package com.hdn.api;

import com.google.gson.Gson;
import com.hdn.cons.Cons;
import com.hdn.dto.VocabularyDto;
import com.hdn.entity.ReviewEntity;
import com.hdn.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.hdn.dto.ReviewDto;

import java.util.List;

@RestController
@RequestMapping("/api/review")
public class ReviewAPI {
    @Autowired
    private ReviewService reviewService;

    @PostMapping("/insert")
    public Integer insertReview(@RequestBody ReviewDto reviewDto) {
        int id = reviewService.addReview(reviewDto);
        return id;
    }

    @GetMapping("/practice")
    public List<ReviewEntity> getReviewForPractice() {
        List<ReviewEntity> reviewEntities = reviewService.getReviewForPractice(Cons.USER_ID,1);
        if (reviewService.isNewDay(Cons.USER_ID)) {
            reviewService.addReviewList(reviewEntities);
        }
        System.out.println(reviewEntities);
        return reviewEntities;
    }
    @PutMapping("/update")
    public Integer updateReview(@RequestBody ReviewDto reviewDto) {
        return reviewService.updateReview(reviewDto);
    }
}
