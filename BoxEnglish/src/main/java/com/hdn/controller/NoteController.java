package com.hdn.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.entity.VocabularyEntity;
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
	
	@GetMapping("detail/{idNote}")
	public String detailNote(@PathVariable("idNote") Long idNote, ModelMap model) {
		List<VocabularyEntity> listVocanote = noteService.getAllNoteDetail(idNote);
		model.addAttribute("listVocanote",listVocanote);
		model.addAttribute("idNote",idNote);
		return "note-detail";
	}
	
	@PostMapping("detail/addWord")
	@ResponseBody
	public VocabularyEntity addWordNote(@RequestParam("idNote") Long idNote,@RequestParam("vocabulary") String vocabulary, @RequestParam("mean_vocabulary") String mean_vocabulary, @RequestParam("file_audio") MultipartFile file_audio) throws JsonProcessingException {
		VocabularyEntity wordNote = new VocabularyEntity();
		CategoryEntity noteEntity = noteService.getNoteById(idNote);
		wordNote.setCategoryEntity(noteEntity);
		wordNote.setFileAudio(file_audio);
		wordNote.setVocabulary(vocabulary);
		wordNote.setMean_vocabulary(mean_vocabulary);
		VocabularyEntity wordSave = noteService.AddWordNote(wordNote);
		VocabularyEntity wordResult = new VocabularyEntity();
		if(wordSave != null) {
			wordResult.setId(wordSave.getId());
			wordResult.setVocabulary(vocabulary);
			wordResult.setMean_vocabulary(mean_vocabulary);
			wordResult.setAudio_vocabulary(wordSave.getAudio_vocabulary());
			return wordResult;
		} else {
			return null;
		}
	}
	
	@DeleteMapping("detail/delete/{idWord}")
	@ResponseBody
	public ResponseEntity<String> deleteWordNote(@PathVariable("idWord") Long idWord) {		
		if(noteService.deleteWordNote(idWord)) {
			return ResponseEntity.ok("Xóa thành công !!!");
		} else {
			return ResponseEntity.badRequest().body("Xóa thất bại !!!");
		}
		
	}
	 
}
