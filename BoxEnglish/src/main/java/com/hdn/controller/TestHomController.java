package com.hdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/")
public class TestHomController {
    @GetMapping(value = "/home")
    public String Home() {
        return "home";
    }
    @GetMapping(value = "/practice-voca")
    public String PracticeVoca() {
        return "practice-voca";
    }

    @GetMapping(value = "/list-voca")
    public String ListVoca() {
        return "list-voca";
    }
    
    @GetMapping(value = "/admin")
    public String Admin() {
        return "admin/index";
    }
}
