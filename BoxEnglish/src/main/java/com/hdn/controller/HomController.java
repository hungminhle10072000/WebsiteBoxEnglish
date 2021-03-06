package com.hdn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.hdn.cons.Cons;
import com.hdn.converter.UserConverter;
import com.hdn.daoimp.ReviewImpl;
import com.hdn.dto.CategoryDto;
import com.hdn.dto.CommentDto;
import com.hdn.dto.UserDto;
import com.hdn.entity.ReviewEntity;
import com.hdn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.CategoryService;
import com.hdn.service.CourseService;
import com.hdn.service.UserService;
import com.sun.jdi.Method;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserConverter userConverter;

	@Autowired
	private ReviewImpl reviewImpl;

	@Autowired
	private CourseService courseService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private CommentService commentService;

	@GetMapping
	public String Home(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "list-box";
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
	public String Register(ModelMap model) {
		model.addAttribute("userAddEntity", new UserEntity());
		return "register";
	}

	@PostMapping("/register")
	public String addAccount(ModelMap model, @ModelAttribute("userAddEntity") UserEntity userAdd, @RequestParam("repeat-password") String repeat_password) {
		if(!userAdd.getPassword().equals(repeat_password)) {
			model.addAttribute("message","M???t kh???u nh???p l???i kh??ng tr??ng kh???p !!!");
			return "register";
		}
		if(userService.checkExistUsername(userAdd.getUsername()) == false) {
			model.addAttribute("message","T??n ????ng nh???p ???? t???n t???i !!! Y??u c???u ?????i t??n ????ng nh???p kh??c !");
			return "register";
		}
		if(userService.checkExistEmail(userAdd.getEmail()) == false) {
			model.addAttribute("message","Email ???? ????ng k?? cho t??i kho???n kh??c !!! Y??u c???u s??? d???ng email kh??c !");
			return "register";
		}
		if(userService.addAccount(userAdd)) {
			model.addAttribute("userAddEntity", new UserEntity());
			model.addAttribute("messageSuccess","Th??m t??i kho???n th??nh c??ng !!!");
		} else {
			model.addAttribute("message","Th??m t??i kho???n th???t b???i !!!");
		}
		return "register";
	}
	
	@GetMapping("edit-info-user")
	public String editInfoUser(ModelMap model,@SessionAttribute("user") UserEntity user) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		model.addAttribute("user", user);
		return "edit-info-user";
	}
	
	@GetMapping(value = "/list-topic")
	public String Topic() {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		return "list-topic";
	}


	@GetMapping(value = "/comment-box/{id}")
	public ModelAndView CommentBox(@PathVariable Long id) {
		if (Cons.USER_ID == -1) {
			return new ModelAndView("login");
		}

		CategoryDto category = categoryService.getCategory(id);
		List<CommentDto> commentDtos = commentService.getCommentByCategoryId(id);
		ModelAndView mav = new ModelAndView("course-description");
		mav.addObject("category",category);
		mav.addObject("commentDtos",commentDtos);
		return mav;
	}

	@GetMapping(value = "/list-box")
	public ModelAndView Box() {
		if (Cons.USER_ID == -1) {
			return new ModelAndView("login");
		}

		ModelAndView mav = new ModelAndView("list-box");

		UserEntity userEntity = userService.GetUser(Cons.USER_ID);
		UserDto user = userConverter.toDto(userEntity);

		int numOfBox1=0,numOfBox2=0,numOfBox3=0,numOfBox4=0,numOfBox5=0,numOfBox6=0;
		List<ReviewEntity> reviewEntitiesBox1 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,1);
		List<ReviewEntity> reviewEntitiesBox2 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,2);
		List<ReviewEntity> reviewEntitiesBox3 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,3);
		List<ReviewEntity> reviewEntitiesBox4 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,4);
		List<ReviewEntity> reviewEntitiesBox5 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,5);
		List<ReviewEntity> reviewEntitiesBox6 = reviewImpl.getReviewsByUserIdAndLevel(Cons.USER_ID,6);
		if (reviewEntitiesBox1 != null) {
			numOfBox1 = reviewEntitiesBox1.size();
		}
		if (reviewEntitiesBox2 != null) {
			numOfBox2 = reviewEntitiesBox2.size();
		}
		if (reviewEntitiesBox3 != null) {
			numOfBox3 = reviewEntitiesBox3.size();
		}
		if (reviewEntitiesBox4 != null) {
			numOfBox4 = reviewEntitiesBox4.size();
		}
		if (reviewEntitiesBox5 != null) {
			numOfBox5 = reviewEntitiesBox5.size();
		}
		if (reviewEntitiesBox6 != null) {
			numOfBox6 = reviewEntitiesBox6.size();
		}
		mav.addObject("numOfBox1",numOfBox1);
		mav.addObject("numOfBox2",numOfBox2);
		mav.addObject("numOfBox3",numOfBox3);
		mav.addObject("numOfBox4",numOfBox4);
		mav.addObject("numOfBox5",numOfBox5);
		mav.addObject("numOfBox6",numOfBox6);
		mav.addObject("user",user);
		return mav;
	}
	@GetMapping(value = "/box-detail")
	public String BoxDetail() {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		return "box-detail";
	}
	
	@GetMapping("list-all-course")
	public String listAllCourse(ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		List<CategoryEntity> listAllCourse = courseService.findAllCourse();
		model.addAttribute("listAllCourse", listAllCourse);
		return "list-all-course";
	}

}
