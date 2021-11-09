package com.hdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/client")
public class DonePracticeController {
    @GetMapping("/donepractice")
    public ModelAndView donePractice() {
        ModelAndView mav = new ModelAndView("done-practice");
        return mav;
    }
}
