package com.hdn.controller.admin;

import java.util.List;

import com.hdn.cons.Cons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdn.entity.CommentEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.CommentService;

@Controller
@RequestMapping("/admin/comment/")
public class AdminCommentController {
	
	@Autowired
	private CommentService commentService;
	
	@GetMapping
	public String defaultAdminComment(ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		List<CommentEntity> listAllComment = commentService.getAllComment();
		model.addAttribute("listAllComment",listAllComment);
		return "admin/admin-comment";
	}
	
	@GetMapping("delete/{idComment}")
	public String deleteUser(ModelMap model, @PathVariable("idComment") Long idComment) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		if(commentService.deleteComment(idComment)) {
			model.addAttribute("messageSuccess", "Xóa thành công !!!");
		} else {
			model.addAttribute("message", "Xóa thất bại !!!");
		}
		List<CommentEntity> listAllComment = commentService.getAllComment();
		model.addAttribute("listAllComment",listAllComment);
		return "admin/admin-comment";
	}
	
}
