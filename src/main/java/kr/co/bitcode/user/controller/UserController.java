package kr.co.bitcode.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bitcode.login.service.LoginService;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;
	
	@RequestMapping("/userInfo.do") 
	public String joinForm() { 
		return "user/userInfo";
	} 
	//수정
	@RequestMapping("/updateUserForm.do") 
	public String updateUserForm()  { 
		return "user/userUpdate";
	} 
	//비번수정
	@RequestMapping("/updatePassForm.do") 
	@ResponseBody
	public String updatePassForm()  { 
		return "user/userUpdate";
	} 
	@RequestMapping("/updateUser.do") 
	public String updateUser(User user, RedirectAttributes attr, HttpSession session) throws Exception { 
		userService.updateUser(user);
		
		User userInfo = loginService.selectUserById(user.getId());	
		session.setAttribute("user", userInfo);
		return "redirect:/user/userInfo.do";
	} 
	
}
