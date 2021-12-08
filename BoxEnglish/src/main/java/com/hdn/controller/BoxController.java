package com.hdn.controller;

import com.google.gson.Gson;
import com.hdn.cons.Cons;
import com.hdn.dto.VocabularyDto;
import com.hdn.service.VocabularyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class BoxController {
    @Autowired
    private VocabularyService vocabularyService;

    @GetMapping("/getVocaInBox/{level}")
    public ModelAndView getVocaInBox(@PathVariable int level) {
        if (Cons.USER_ID == -1) {
            return new ModelAndView("login");
        }

        List<VocabularyDto> vocabularyDtoList = vocabularyService.getVocabularyByUserIdAndLevel(Cons.USER_ID,level);
//        String jsonVocaList = new Gson().toJson(vocabularyDtoList);
        ModelAndView mav = new ModelAndView("box-detail");
        mav.addObject("lstVoca",vocabularyDtoList);
        return mav;
    }
}
