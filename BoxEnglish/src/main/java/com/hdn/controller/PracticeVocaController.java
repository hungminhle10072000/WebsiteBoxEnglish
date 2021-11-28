package com.hdn.controller;

import com.google.gson.Gson;
import com.hdn.cons.Cons;
import com.hdn.dto.CategoryDto;
import com.hdn.dto.VocabularyDto;
import com.hdn.service.CategoryService;
import com.hdn.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/practice")
public class PracticeVocaController {
    @Autowired
    private VocabularyService vocabularyService;

    @GetMapping("/getAll")
    public ModelAndView getAllVocabulary() {
        List<VocabularyDto> vocabularyDtoList = vocabularyService.getAllVocabulary();
        String jsonVocaList = new Gson().toJson(vocabularyDtoList);
        ModelAndView mav = new ModelAndView("practice-voca");
        mav.addObject("lstVoca",jsonVocaList);
        System.out.println("GetAllVocaa");
        return mav;
    }

    @GetMapping("/getVocaForPractice")
    public ModelAndView getVocabularyForPractice() {
        List<VocabularyDto> vocabularyDtoList = vocabularyService.getVocabularyForPractice(Cons.USER_ID,3);
        String jsonVocaList = new Gson().toJson(vocabularyDtoList);
        ModelAndView mav;
        if (vocabularyDtoList.size() < 1) {
            mav = new ModelAndView("done-practice");
        } else {
            mav = new ModelAndView("practice-voca");
        }

        mav.addObject("lstVoca",jsonVocaList);
        return mav;
    }
}
