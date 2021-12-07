package com.hdn.controller;

import com.hdn.cons.Cons;
import com.hdn.dto.VocabularyDto;
import com.hdn.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/client")
public class DonePracticeController {

    @Autowired
    private VocabularyService vocabularyService;
    @GetMapping("/donepractice")
    public ModelAndView donePractice() {
        List<VocabularyDto> vocaCorrect = vocabularyService.getVocabularyForPractice(Cons.USER_ID,1);
        List<VocabularyDto> vocaWrong = vocabularyService.getVocabularyForPractice(Cons.USER_ID,0);
        ModelAndView mav = new ModelAndView("done-practice");
        mav.addObject("vocaCorrect",vocaCorrect);
        mav.addObject("vocaWrong",vocaWrong);
        return mav;
    }
}
