package com.hdn.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

@Controller
@RequestMapping("/note/")
@SessionAttributes({"user"})
public class NoteController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private NoteService noteService;
	
	@GetMapping
	public String defaultNote(ModelMap model) {
		model.addAttribute("noteEntity", new CategoryEntity());
		return "list-note";
	}
	
	@PostMapping("add")
	@ResponseBody
	public String addNote(@ModelAttribute("noteEntity") CategoryEntity note, @ModelAttribute("user") UserEntity user) {
		note.setIsDelete(0);
		note.setUserEntity(user);
		try {
			String path = context.getRealPath("/resources/img/" + note.getFileImage().getOriginalFilename());
			note.getFileImage().transferTo(new File(path));
			note.setImage(path);
			if(noteService.AddNote(note)) return "Thêm thành công";
			else return "Thêm thất bại";
		} catch (Exception e) {
			return "Thêm thất bại";
		}		
//		return "list-note";
	}
}
