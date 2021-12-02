package com.hdn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hdn.cons.Cons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;

import antlr.collections.List;

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
	
	@PostMapping(value = "update-info", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> updateInfo(@SessionAttribute("user") UserEntity user, @RequestParam("fullname") String fullname, @RequestParam("username") String username, @RequestParam(name="file_avatar", required = false) MultipartFile file_avatar){
		Map<String, Object> map = new HashMap<String, Object>();
		if(userService.checkExistUsername(username) == false && user.getUsername().equals(username) == false) {
			map.put("error", "Tên đăng nhập đã tồn tại !!! Yêu cầu đổi tên đăng nhập khác");
			return ResponseEntity.badRequest().body(map);
		} else {
			UserEntity userUpdate = userService.updateInfoUser(user, fullname, username, file_avatar);
			if(userUpdate != null) {
				user = userUpdate;
				map.put("success", "Cập nhật thành công !!!");
				map.put("pathImgNew", user.getAvatar());
				return ResponseEntity.ok(map);
			} else {
				map.put("error", "Cập nhật thất bại !!!");
				return ResponseEntity.badRequest().body(map);
			}		
		}		
	}
	
	@GetMapping("logout")
	public String userLogout(HttpSession session) {
		Cons.USER_ID=-1;
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("sendVali")
	public String sendVali(ModelMap model,@RequestParam("username") String username, @RequestParam("email") String email,HttpServletResponse response) {
		if(userService.checkUserNameEmail(username, email)) {
			if(!userService.sendVali(email).equals("")) {
				String valueVali = userService.sendVali(email);
				Cookie cookie = new Cookie("valuaVali", valueVali);
				cookie.setMaxAge(10 * 60);
				response.addCookie(cookie);
				model.addAttribute("messageSuccess","Gửi mã xác thực thành công !!!");
			} else {
				model.addAttribute("message","Gửi mã xác thực thất bại !!!");
			}		
		} else {
			model.addAttribute("message","Tên đăng nhập hoặc email không chính xác !!!");
		}
		return "login";
	}
	
	@PostMapping("resetPassWord")
	public String resetPassword(ModelMap model,@RequestParam("username") String username,@RequestParam("newpassword") String newpassword, @RequestParam("repeat_password") String repeat_password,@RequestParam("code") String code, @CookieValue(value = "valuaVali", defaultValue = "unknown") String valuaVali,
								HttpServletRequest request, HttpServletResponse response) {
		if(userService.checkExistUsername(username) == false) {
			if(!newpassword.equals(repeat_password)) {
				model.addAttribute("newpassword",newpassword);
				model.addAttribute("repeat_password",repeat_password);
				model.addAttribute("code",code);
				model.addAttribute("username",username);
				model.addAttribute("message2","Mật khẩu nhập lại không trùng khớp !!!");
			} else {
				if(valuaVali.equals("unknown")) {
					model.addAttribute("newpassword",newpassword);
					model.addAttribute("repeat_password",repeat_password);
					model.addAttribute("code",code);
					model.addAttribute("username",username);
					model.addAttribute("message2","Mã xác thực đã hết hạn !!! Yêu cầu lấy lại mã xác thực !!!");
				} else {
					if(!valuaVali.equals(code)) {
						model.addAttribute("newpassword",newpassword);
						model.addAttribute("repeat_password",repeat_password);
						model.addAttribute("code",code);
						model.addAttribute("username",username);
						model.addAttribute("message2","Mã xác thực không đúng !!! Yêu cầu nhập lại mã xác thực !!!");
					} else {
						if(userService.resetPassword(username, newpassword)) {
						    Cookie cookie = null;
					        Cookie[] cookies = null;
					        cookies = request.getCookies();
					        if (cookies != null) {					 
					            for (int i = 0; i < cookies.length; i++) {
					                cookie = cookies[i];
					 
					                if ((cookie.getName()).compareTo("valuaVali") == 0) {
					                	
					                    // delete cookie
					                    cookie.setMaxAge(0);
					                    response.addCookie(cookie);
					                    
					                }
					            }
					        }
							model.addAttribute("messageSuccess2","Cập nhật mật khẩu thành công !!!");
						} else {
							model.addAttribute("newpassword",newpassword);
							model.addAttribute("repeat_password",repeat_password);
							model.addAttribute("code",code);
							model.addAttribute("username",username);
							model.addAttribute("message2","Cập nhật mật khẩu thất bại !!!");
						}				
					}
				}		
			}
		} else {
			model.addAttribute("newpassword",newpassword);
			model.addAttribute("repeat_password",repeat_password);
			model.addAttribute("code",code);
			model.addAttribute("username",username);
			model.addAttribute("message2","Tên đăng nhập không chính xác !!!");
		}
		
		return "login";
	}
	
}
