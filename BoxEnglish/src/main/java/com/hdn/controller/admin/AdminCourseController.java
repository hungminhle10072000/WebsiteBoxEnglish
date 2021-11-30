package com.hdn.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.CourseService;

@Controller
@RequestMapping("/admin/course/")
public class AdminCourseController {
	
	@Autowired
	CourseService courseService;
	
	@GetMapping
	public String defaultAdminCourse(ModelMap model) {
		List<CategoryEntity> listAllCourse = courseService.findAllCourse();
		model.addAttribute("listAllCourse",listAllCourse);
		return "admin/admin-course";
	}
	
	@DeleteMapping("delete/{idCourse}")
	@ResponseBody
	public ResponseEntity<String> deleteCourse(ModelMap model, @PathVariable("idCourse") Long idCourse){
		if(courseService.deleteCourse(idCourse)) {
			List<CategoryEntity> listAllCourse = courseService.findAllCourse();
			model.addAttribute("listAllCourse",listAllCourse);
			return ResponseEntity.ok("Xóa thành công !!!");
		} else {
			return ResponseEntity.badRequest().body("Xóa thất bại !!!");
		}
	}
	
	@GetMapping("addCourse")
	public String addCourse(ModelMap model){
		CategoryEntity addCourse = new CategoryEntity();
		model.addAttribute("courseAddEntity",addCourse);
		return "admin/add-course";
	}
	
	@PostMapping("addCourse")
	public String addCourse(ModelMap model, @ModelAttribute("courseAddEntity") CategoryEntity courseAddEntity, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		if(courseService.addCourse(user, courseAddEntity)) {
			CategoryEntity addCourse = new CategoryEntity();
			model.addAttribute("courseAddEntity",addCourse);
			model.addAttribute("messageSuccess","Thêm tài khoản thành công !!!");
		} else {
			model.addAttribute("message","Thêm tài khoản thất bại !!!");
		}
		return "admin/add-course";
	}
	
	@GetMapping("editCourse/{idCourse}")
	public String editCourse(ModelMap model, @PathVariable("idCourse") Long idCourse) {
		CategoryEntity courseEdit = courseService.findCourseById(idCourse);
		model.addAttribute("courseEditEntity",courseEdit);
		return "admin/edit-course";
	}
	
	@PostMapping("editCourse/{idCourse}")
	public String updateCourse(ModelMap model, @ModelAttribute("courseEditEntity") CategoryEntity courseEditEntity, HttpSession session) {
		UserEntity user = (UserEntity) session.getAttribute("user");
		courseEditEntity.setUserEntity(user);
		if(courseService.updateCourse(courseEditEntity)) {
			CategoryEntity courseEdit = courseService.findCourseById(courseEditEntity.getId());
			model.addAttribute("courseEditEntity",courseEdit);
			model.addAttribute("messageSuccess","Cập nhật thành công !!!");
		} else {
			model.addAttribute("message","Cập nhật thất bại !!!");
		}
		return "admin/edit-course";
	}
}
