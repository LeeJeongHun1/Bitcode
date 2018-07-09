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
	//회원가입
	@RequestMapping("/signupForm.do") 
	public String signupForm() { 
		return "login/signupForm";
	} 
	//로그인 된 후 메인화면 이동
	@RequestMapping("/login.do")
	public String login() {
		return "login/loginForm";
	}
	// 회원가입후 로그인화면 이동
	@RequestMapping("/signup.do")
	public String signup() {
		return "login/loginForm";
	}
	
	
	

	// ID찾기
//	@RequestMapping("/fogetId.json") 
//	@ResponseBody
//	public Member fogetId(Member member) throws Exception { 
//		Member dbmember = loginService.selectMemberByName(member);
//		System.out.println("디비 멤버 : " + dbmember);
//		if(dbmember.getEmail().equals(member.getEmail())){
//			return dbmember;
//		}
//		return member;
	
	
	//Pass 찾기
	@RequestMapping("/findPassForm.do")
	public String findPassForm() {
		return "login/findPassForm";
	}
	
	@RequestMapping("/findPass.do")
	public String findPass() {
		return "login/loginForm";
	}
	
	
}
