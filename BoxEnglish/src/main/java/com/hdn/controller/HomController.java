package com.hdn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;
import com.sun.jdi.Method;

@Controller
@RequestMapping("/")
public class HomController {

	@Autowired
	private UserService userService;

	@GetMapping
	public String Home(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "home";
		} else {
			return "redirect:/login";
		}

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
		return "redirect:note/";
	}

	@GetMapping(value = "/login")
	public String Login() {
		return "login";
	}

	@GetMapping(value = "/register")
	public String Register() {
		return "register";
	}
	
	@GetMapping("edit-info-user")
	public String editInfoUser(ModelMap model,@SessionAttribute("user") UserEntity user) {
		model.addAttribute("user", user);
		return "edit-info-user";
	}
	@GetMapping(value = "/list-box")
	public String listBox() {
		return "list-box";
	}

}
