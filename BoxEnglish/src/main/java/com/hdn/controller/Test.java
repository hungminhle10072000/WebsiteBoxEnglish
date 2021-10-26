package com.hdn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;

@Controller
@RequestMapping("/")
public class Test {
	
	@Autowired
	UserService userService;
	
	@GetMapping
	public String Default() {
		Long idTest = (long) 1.0;
		UserEntity userEntity = userService.GetUser(idTest);
		if(userEntity != null) {
			System.out.println(userEntity.getUsername());
		} else {
			System.out.println("Khong co nhan vien nay");
		}
		return "index";
	}
}
