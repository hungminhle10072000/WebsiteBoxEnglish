package com.hdn.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.NoteService;
import com.hdn.service.UserService;


@Controller
@SessionAttributes("user")
@RequestMapping("/note/")
public class NoteController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private NoteService noteService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping
	public String defaultNote(ModelMap model, @ModelAttribute("user") UserEntity user) {
		List<CategoryEntity> noteList = noteService.getAllNote(user.getId());
		model.addAttribute("noteEntity", new CategoryEntity());
		model.addAttribute("noteList", noteList);
		return "list-note";
	}
	
	@PostMapping("add")
	public String addNote(ModelMap model, @ModelAttribute("noteEntity") CategoryEntity note, @ModelAttribute("user") UserEntity user) {
		note.setIsDelete(0);
		note.setUserEntity(user);
		try {
			String path = context.getRealPath("/") + "resources/img/" + note.getFileImage().getOriginalFilename();
			note.getFileImage().transferTo(new File(path));
			note.setImage(note.getFileImage().getOriginalFilename());
			if(noteService.AddNote(note)) {
				model.addAttribute("message","Thêm ghi chú thành công !!!");
			}	
			else {
				model.addAttribute("message","Thêm ghi chú thất bại !!!");
			}
				
		} catch (Exception e) {
			model.addAttribute("message","Thêm ghi chú thất bại !!!");
			
		} finally {
			List<CategoryEntity> noteList = noteService.getAllNote(user.getId());
			model.addAttribute("noteEntity", new CategoryEntity());
			model.addAttribute("noteList", noteList);
			return "list-note";
		}
	}
	
	@GetMapping("delete/{idNote}")
	public String deleteNote(@PathVariable("idNote") Long idNote, ModelMap model, @ModelAttribute("user") UserEntity user) {
		try {
			if(noteService.deleteNote(idNote)) {
				model.addAttribute("message","Xóa ghi chú thành công !!!");
			} else model.addAttribute("message","Xóa ghi chú thất bại !!!");
		} catch (Exception e) {
			model.addAttribute("message","Xóa ghi chú thất bại !!!");
		} finally {
			List<CategoryEntity> noteList = noteService.getAllNote(user.getId());
			model.addAttribute("noteEntity", new CategoryEntity());
			model.addAttribute("noteList", noteList);
			return "list-note";
		}	
	}
	
	@GetMapping("edit/{idNote}")
	public String editNote(@PathVariable("idNote") Long idNote, ModelMap model) {
		CategoryEntity noteEdit = noteService.getNoteById(idNote);
		model.addAttribute("noteEdit",noteEdit);
		return "edit-note";
	}
	
	@PostMapping("update/{idNote}")
	public String updateNote(@PathVariable("idNote") Long idNote, ModelMap model, @ModelAttribute("user") UserEntity user, @ModelAttribute("noteEdit") CategoryEntity note) {
		if(noteService.UpdateNote(idNote, note)) {
			model.addAttribute("message", "Cập nhật ghi chú thành công !!!");
		} else {
			model.addAttribute("message", "Cập nhật ghi chú thất bại !!!");
		}
		List<CategoryEntity> noteList = noteService.getAllNote(user.getId());
		model.addAttribute("noteEntity", new CategoryEntity());
		model.addAttribute("noteList", noteList);
		return "list-note";
	}
	
	@ModelAttribute("user")
	public UserEntity getUserForTest () {
		Long test = (long) 1;
	    UserEntity userEntityTest = userService.GetUser(test);
	    return userEntityTest;
	}
	 
}
