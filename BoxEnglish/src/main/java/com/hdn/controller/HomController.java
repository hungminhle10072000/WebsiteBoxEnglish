package com.hdn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;

@Controller
@RequestMapping("/")
public class HomController {
	
	@Autowired
	private UserService userService;
	
    @GetMapping
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
    
    @GetMapping("list-note")
    public String listNote(HttpSession httpSession) {
    	Long test = (long) 1;
    	UserEntity userEntity = userService.GetUser(test);
    	System.out.println(userEntity.getFullname());
    	httpSession.setAttribute("user", userEntity);
    	return "redirect:note/";
    }
    
}
