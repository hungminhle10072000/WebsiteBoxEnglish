package com.hdn.controller;

import com.hdn.cons.Cons;
import com.hdn.dto.CategoryDto;
import com.hdn.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hdn.entity.UserEntity;
import com.hdn.service.Cate_User_Service;
import com.hdn.service.CourseService;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/course/")
public class CourseController {
	
	@Autowired
	CourseService courseService;
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	Cate_User_Service cate_User_Service;
	
	@PostMapping( value = "addCourse/{idCourse}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> addCourse(@PathVariable("idCourse") Long idCourse, @SessionAttribute("user") UserEntity userEntity) {
		if(cate_User_Service.checkCateUser(idCourse, userEntity)) {
			boolean result = courseService.AddCourseUser(idCourse, userEntity);
			if(result) {
				return ResponseEntity.ok("Thêm khóa học thành công !!!");
			}
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thêm khóa học thất bại !!!");
		} else {
			return ResponseEntity.ok("Khóa học đã đăng ký rồi !!!");
		}
	}

	@GetMapping("/getMyCourse")
	public ModelAndView getAllMyCourse() {
		if (Cons.USER_ID == -1) {
			return new ModelAndView("login");
		}

		Long userId = Cons.USER_ID;
		List<CategoryDto> listMyCourse = cate_User_Service.findCourseByUserId(userId);
		ModelAndView mav = new ModelAndView("list-my-course");
		mav.addObject("listMyCourse",listMyCourse);
		return mav;
	}

}
