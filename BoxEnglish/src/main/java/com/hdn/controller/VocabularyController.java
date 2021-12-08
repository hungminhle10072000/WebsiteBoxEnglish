package com.hdn.controller;

import com.google.gson.Gson;
import com.hdn.cons.Cons;
import com.hdn.converter.VocabularyConverter;
import com.hdn.dto.ReviewDto;
import com.hdn.dto.VocabularyDto;
import com.hdn.entity.VocabularyEntity;
import com.hdn.service.ReviewService;
import com.hdn.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
@RequestMapping("/voca/")
public class VocabularyController {

    @Autowired
    private VocabularyService vocabularyService;

    @Autowired
    private VocabularyConverter vocabularyConverter;
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/getVocaByCourseId/{courseId}")
    public ModelAndView getVocaByCourseId(@PathVariable Long courseId) {
        if (Cons.USER_ID == -1) {
            return new ModelAndView("login");
        }

        List<VocabularyEntity> vocabularyEntities = vocabularyService.findVocaCourse(courseId);
        List<VocabularyDto> vocabularyDtos = vocabularyConverter.toListDto(vocabularyEntities);
        List<ReviewDto> reviewDtos = reviewService.getReviewsByUserIdAndVocaIDAndCateId(Cons.USER_ID,courseId);
        String jsonReviewDtos = new Gson().toJson(reviewDtos);
        String jsonvocabularyDtos = new Gson().toJson(vocabularyDtos);
        ModelAndView mav = new ModelAndView("my-course-detail");
        mav.addObject("lstVoca",vocabularyDtos);
        mav.addObject("lstReview",jsonReviewDtos);
        mav.addObject("lstJsonVoca",jsonvocabularyDtos);
        return mav;
    }

    @GetMapping("/getVocaByCourseIdAllCourse/{courseId}")
    public ModelAndView getVocaByCourseId_AllCourse(@PathVariable Long courseId) {
        if (Cons.USER_ID == -1) {
            return new ModelAndView("login");
        }

        List<VocabularyEntity> vocabularyEntities = vocabularyService.findVocaCourse(courseId);
        List<VocabularyDto> vocabularyDtos = vocabularyConverter.toListDto(vocabularyEntities);

        ModelAndView mav = new ModelAndView("course-detail");
        mav.addObject("lstVoca",vocabularyDtos);

        return mav;
    }
}
