package kr.co.bitcode.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

	//로그인 페이지
	@RequestMapping("/loginForm.do") 
	public String joinForm() { 
		return "login/loginForm";
	} 
	
	
	
}
