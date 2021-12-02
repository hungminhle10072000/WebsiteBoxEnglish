package com.hdn.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hdn.cons.Cons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hdn.daoimp.UserImp;
import com.hdn.entity.UserEntity;

@Controller
public class HomeAPI {
	String msg;

	 @Autowired
	private UserImp loginDao;

	 //@Autowired
	private UserEntity userEntity;

	public void init() {
		loginDao = new UserImp();
		userEntity = new UserEntity();

	}

	@RequestMapping(value = { "/validationlogin", "/register", "/logout" })
	public String LoGin(HttpServletRequest request) {
		UserImp userDAO = new UserImp();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		userEntity = loginDao.findbyusername_password(username, password);
		if (userEntity != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", userEntity);
			Cons.USER_ID=userEntity.getId();
			if (userEntity.getRole().equals("1")) {
				return "admin/index";
			} else {
				return "home";
			}
		} else {
			msg = "Tên đăng nhập hoặc mật khẩu không chính xác.";
			request.setAttribute("msg", msg);
			return "login";
		}

	}
}
