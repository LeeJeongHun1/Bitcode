package kr.co.bitcode.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/userInfo.do") 
	public String joinForm() { 
//		System.out.println("userInfo들어옴");
		return "user/userInfo";
	} 
	
}
