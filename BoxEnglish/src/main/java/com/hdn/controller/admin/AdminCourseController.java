package com.hdn.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.hdn.cons.Cons;
import org.jvnet.fastinfoset.Vocabulary;
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
import com.hdn.entity.VocabularyEntity;
import com.hdn.service.CourseService;
import com.hdn.service.VocabularyService;

@Controller
@RequestMapping("/admin/course/")
public class AdminCourseController {
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	VocabularyService vocabularyService;
	
	@GetMapping
	public String defaultAdminCourse(ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

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
	
	@DeleteMapping("deleteVoca/{idCourse}")
	@ResponseBody
	public ResponseEntity<String> deleteVocaCouse(ModelMap model, @PathVariable("idCourse") Long idCourse) {
		if(vocabularyService.deleteVocaCouse(idCourse)) {
			List<VocabularyEntity> listAllVocaCourse = vocabularyService.findVocaCourse(idCourse);
			model.addAttribute("listAllVocaCourse",listAllVocaCourse);
			return ResponseEntity.ok("Xóa thành công !!!");
		} else {
			return ResponseEntity.badRequest().body("Xóa thất bại !!!");
		}
	}
	
	@GetMapping("addCourse")
	public String addCourse(ModelMap model){
		if (Cons.USER_ID == -1) {
			return "login";
		}

		CategoryEntity addCourse = new CategoryEntity();
		model.addAttribute("courseAddEntity",addCourse);
		return "admin/add-course";
	}
	
	@PostMapping("addCourse")
	public String addCourse(ModelMap model, @ModelAttribute("courseAddEntity") CategoryEntity courseAddEntity, HttpSession session) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		UserEntity user = (UserEntity) session.getAttribute("user");
		if(courseService.addCourse(user, courseAddEntity)) {
			CategoryEntity addCourse = new CategoryEntity();
			model.addAttribute("courseAddEntity",addCourse);
			model.addAttribute("messageSuccess","Thêm khóa học thành công !!!");
		} else {
			model.addAttribute("message","Thêm khóa học thất bại !!!");
		}
		return "admin/add-course";
	}
	
	@GetMapping("editCourse/{idCourse}")
	public String editCourse(ModelMap model, @PathVariable("idCourse") Long idCourse) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		CategoryEntity courseEdit = courseService.findCourseById(idCourse);
		model.addAttribute("courseEditEntity",courseEdit);
		return "admin/edit-course";
	}
	
	@PostMapping("editCourse/{idCourse}")
	public String updateCourse(ModelMap model, @ModelAttribute("courseEditEntity") CategoryEntity courseEditEntity, HttpSession session) {
		if (Cons.USER_ID == -1) {
			return "login";
		}


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
	
	@GetMapping("detail/{idCourse}")
	public String detailCourse(ModelMap model, @PathVariable("idCourse") Long idCourse) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		CategoryEntity course = courseService.findCourseById(idCourse);
		model.addAttribute("courseDetail", course);
		model.addAttribute("idCourse",idCourse);
		List<VocabularyEntity> listAllVocaCourse = vocabularyService.findVocaCourse(idCourse);
		model.addAttribute("listAllVocaCourse",listAllVocaCourse);
		return "admin/detail-course";
	}
	
	@GetMapping("detail/addVoca/{idCourse}")
	public String addVocaCourse(ModelMap model, @PathVariable("idCourse") Long idCourse) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		VocabularyEntity vocabularyAddEntity  = new VocabularyEntity();
		model.addAttribute("idCourse", idCourse);
		model.addAttribute("vocabularyAddEntity",vocabularyAddEntity);
		return "admin/add-vocabulary";
	}
	
	@PostMapping("detail/addVoca/{idCourse}")
	public String addVocaCourse(ModelMap model, @PathVariable("idCourse") Long idCourse, @ModelAttribute("vocabularyAddEntity") VocabularyEntity vocabularyAddEntity)
	{
		if (Cons.USER_ID == -1) {
			return "login";
		}

		CategoryEntity course = courseService.findCourseById(idCourse);
		vocabularyAddEntity.setCategoryEntity(course);
		if(vocabularyService.addVocaCourse(vocabularyAddEntity)) {
			model.addAttribute("idCourse", idCourse);
			model.addAttribute("vocabularyAddEntity",new VocabularyEntity());
			model.addAttribute("messageSuccess","Thêm từ mới thành công !!!");
		} else {
			model.addAttribute("message","Thêm từ mới thất bại !!!");
		}
		return "admin/add-vocabulary";
	}

	@GetMapping("detail/edit/{idCourse}/{idVoca}")
	public String editVocaCouse(ModelMap model, @PathVariable("idCourse") Long idCourse,@PathVariable("idVoca") Long idVoca) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		VocabularyEntity vocaEdit = vocabularyService.getVocaById(idVoca);
		model.addAttribute("idCourse", idCourse);
		model.addAttribute("vocabularyEditEntity",vocaEdit);
		return "admin/edit-vocabulary";
	}
	
	@PostMapping("detail/edit/{idCourse}/{idVoca}")
	public String updateVocaCouse(ModelMap model, @PathVariable("idCourse") Long idCourse,@PathVariable("idVoca") Long idVoca,@ModelAttribute("vocabularyEditEntity") VocabularyEntity vocabularyEditEntity) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		if(vocabularyService.updateVocaCourse(idVoca, vocabularyEditEntity)) {
			VocabularyEntity voca = vocabularyService.getVocaById(vocabularyEditEntity.getId());
			model.addAttribute("vocabularyEditEntity",voca);
			model.addAttribute("messageSuccess","Cập nhật thành công !!!");
		} else {
			model.addAttribute("message","Cập nhật thất bại !!!");
		}
		model.addAttribute("idCourse", idCourse);
		return "admin/edit-vocabulary";
	}
}
