package com.hdn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@PostMapping(value = "changePassword", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> updatePassword(HttpSession session,@RequestParam("passwordOld") String passwordOld, @RequestParam("passwordNew") String passwordNew) {	
		if(session.getAttribute("user") != null) {
			UserEntity user = (UserEntity) session.getAttribute("user");
			if(!(user.getPassword().equals(passwordOld))) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Mật khẩu hiện tại không đúng !!!");
			} else {
				String passWordUser = user.getPassword();
				user.setPassword(passwordNew);
				if(userService.updatePassWord(user)) {
					return ResponseEntity.ok("Thay đổi mật khẩu thành công !!!");
				} else {
					user.setPassword(passWordUser);
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thay đổi mật khẩu thất bại");
				}
				
			}
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Thay đổi mật khẩu thất bại");	
	}
	
	@GetMapping("logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
