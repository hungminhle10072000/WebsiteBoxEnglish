package com.hdn.controller.admin;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.hdn.cons.Cons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hdn.dto.PaginationResult;
import com.hdn.entity.CategoryEntity;
import com.hdn.entity.UserEntity;
import com.hdn.service.UserService;

@Controller
@RequestMapping("/admin/user/")
public class AdminUserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping
	public String defaultAdminUser(ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		List<UserEntity> listAllUser = userService.getAllUser();
		model.addAttribute("listAllUser",listAllUser);
		return "admin/admin-user";
	}
	
	@DeleteMapping("delete/{idUser}")
	@ResponseBody
	public ResponseEntity<String> deleteUser(ModelMap model, @PathVariable("idUser") Long idUser) {
		if(userService.deleteUser(idUser)) {
			List<UserEntity> listAllUser = userService.getAllUser();
			model.addAttribute("listAllUser",listAllUser);
			return ResponseEntity.ok("Xóa thành công !!!");
		} else {
			return ResponseEntity.badRequest().body("Xóa thất bại !!!");
		}
	}
	
	@GetMapping("addAccount")
	public String addAccount(ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		Map<Integer, String> mapRole = new HashMap<Integer, String>();
		mapRole.put(0, "User");
		mapRole.put(1, "Admin");
		model.addAttribute("userAddEntity", new UserEntity());
		model.addAttribute("mapRole",mapRole);
		return "admin/add-account";
	}
	
	@PostMapping("addAccount")
	public String addAccount(ModelMap model, @ModelAttribute("userAddEntity") UserEntity userAdd, @RequestParam("repeat-password") String repeat_password) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		if(!userAdd.getPassword().equals(repeat_password)) {
			model.addAttribute("message","Mật khẩu nhập lại không trùng khớp !!!");
			return "admin/add-account";
		}
		if(userService.checkExistUsername(userAdd.getUsername()) == false) {
			model.addAttribute("message","Tên đăng nhập đã tồn tại !!! Yêu cầu đổi tên đăng nhập khác !");
			return "admin/add-account";
		}
		if(userService.checkExistEmail(userAdd.getEmail()) == false) {
			model.addAttribute("message","Email đã đăng ký cho tài khoản khác !!! Yêu cầu sử dụng email khác !");
			return "admin/add-account";
		}
		if(userService.addAccount(userAdd)) {
			Map<Integer, String> mapRole = new HashMap<Integer, String>();
			mapRole.put(0, "User");
			mapRole.put(1, "Admin");
			model.addAttribute("userAddEntity", new UserEntity());
			model.addAttribute("mapRole",mapRole);
			model.addAttribute("messageSuccess","Thêm tài khoản thành công !!!");
		} else {
			model.addAttribute("message","Thêm tài khoản thất bại !!!");
		}
		return "admin/add-account";
	}
	
	@GetMapping("editAccount/{idUserEdit}")
	public String editAccount(@PathVariable("idUserEdit") Long idUserEdit, ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		UserEntity userEdit = userService.GetUser(idUserEdit);
		model.addAttribute("userEditEntity",userEdit);
		Map<String, String> mapRole = new HashMap<String, String>();
		mapRole.put("0", "User");
		mapRole.put("1", "Admin");
		model.addAttribute("mapRole",mapRole);
		return "admin/edit-account";
	}
	
	@GetMapping("editAccount/resetPassword/{idUserEdit}")
	public String resetPassWord(@PathVariable("idUserEdit") Long idUserEdit, ModelMap model) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		UserEntity userEdit = userService.GetUser(idUserEdit);
		model.addAttribute("userEditEntity",userEdit);
		Map<String, String> mapRole = new HashMap<String, String>();
		mapRole.put("0", "User");
		mapRole.put("1", "Admin");
		model.addAttribute("mapRole",mapRole);
		if(userService.resetPassWord(userEdit)) {
			model.addAttribute("messageSuccess","Đặt lại mật khẩu thành công !!!");
		} else {
			model.addAttribute("message","Đặt lại mật khẩu thất bại !!!");
		}
		return "admin/edit-account";
	}
	
	@PostMapping("editAccount")
	public String updateAccount(ModelMap model, @ModelAttribute("userEditEntity") UserEntity accountUpdate) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		Map<String, String> mapRole = new HashMap<String, String>();
		mapRole.put("0", "User");
		mapRole.put("1", "Admin");
		model.addAttribute("mapRole",mapRole);
		
		UserEntity userCheckUserName = userService.getuserByUserName(accountUpdate.getUsername());
		UserEntity userCheckUserEmail = userService.getUserByEmail(accountUpdate.getEmail());
		boolean checkUser = userCheckUserName == null;
		boolean checkEmail = userCheckUserEmail == null;
		if(checkUser == false) {
			if(userCheckUserName.getId() != accountUpdate.getId()) {
				model.addAttribute("message","Tên đăng nhập đã tồn tại !!! Yêu cầu đổi tên đăng nhập khác !");
				return "admin/edit-account";
			}
		}
		if(checkEmail == false) {
			if(userCheckUserEmail.getId() != accountUpdate.getId()) {
				model.addAttribute("message","Email đã đăng ký cho tài khoản khác !!! Yêu cầu sử dụng email khác !");
				return "admin/edit-account";
			}
		}
		if(userService.updateAccount(accountUpdate)) {
			UserEntity userEdit = userService.GetUser(accountUpdate.getId());
			model.addAttribute("userEditEntity",userEdit);
			model.addAttribute("messageSuccess","Cập nhật thành công !!!");
		} else {
			model.addAttribute("message","Cập nhật thất bại !");
		}
		return "admin/edit-account";
	}
	
	@GetMapping("edit-info-user")
	public String editInfoUser(ModelMap model,@SessionAttribute("user") UserEntity user) {
		if (Cons.USER_ID == -1) {
			return "login";
		}

		model.addAttribute("user", user);
		return "admin/admin-edit-info";
	}
}
