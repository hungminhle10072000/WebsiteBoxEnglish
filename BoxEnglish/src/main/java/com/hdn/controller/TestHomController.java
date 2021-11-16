package com.hdn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hdn.entity.UserEntity;
import com.sun.jdi.Method;

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
    
    @GetMapping(value = "")
	public String Login(/* ModelMap mm */) {
    	
    	//mm.put("user", new UserEntity());
        return "login";
    }
    
    @GetMapping(value = "/register")
    public String Register() {
        return "register";
    }
}
