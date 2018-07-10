package kr.co.bitcode.login.controller;



import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bitcode.login.service.LoginService;
import kr.co.bitcode.repository.domain.User;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;
	
	@Autowired
	private LoginService loginService;
	
	
	
	

	//로그인 클릭시 
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "login/loginForm";
	}
	//로그인 (ID, Pass 입력 후)
	@RequestMapping("/login.do")
	public String login(User user, HttpSession session,  RedirectAttributes attr) throws Exception{
		
		User userInfo = loginService.selectUserById(user.getId());
		if(userInfo != null && passCode.matches(user.getPassword(), userInfo.getPassword())) {
			session.setAttribute("user", userInfo);
			return "redirect:/main/main.do";
		}else {
			attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 맞지 않습니다");
			return "login/loginForm";
		}
	}	
	
	
//		System.out.println(user.getPassword());
//		System.out.println(passCode.encode(userInfo.getPassword()));
//	System.out.println(user.getPassword());
//	passCode.matches(user.getPassword(), userInfo.getPassword())
	
	//회원가입
	@RequestMapping("/signupForm.do") 
	public String signupForm() throws Exception{ 
		return "login/signupForm";
	
	} 
	
	// 회원가입후 로그인화면 이동
	@RequestMapping("/signup.do") 
	public String signup(User user, RedirectAttributes attr, HttpSession session) throws Exception{ 
		
		 user.setPassword(passCode.encode(user.getPassword()));
		 System.out.println("유저 비번코드 : " + user.getPassword());
		 loginService.insertMemberInfo(user);
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
