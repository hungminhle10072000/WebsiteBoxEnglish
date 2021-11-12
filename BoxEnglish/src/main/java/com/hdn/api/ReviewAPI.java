package com.hdn.api;

import com.google.gson.Gson;
import com.hdn.dto.VocabularyDto;
import com.hdn.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.hdn.dto.ReviewDto;

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
}
