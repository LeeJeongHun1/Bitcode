package kr.co.bitcode.login.controller;



import java.io.File;



import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	//카카오톡 로그인시 bitcode에 회원가입이 되어있는지 확인
	@RequestMapping("/kakaoForm.do") 
	public String kakaoForm(User user, Model model) throws Exception { 
		System.out.println("kakaoForm 들어옴");
		User users = loginService.selectUserById(user.getId());
		if(users != null) {
			return "redirect:/main/main.do";
		}
		System.out.println(user.getId());
		model.addAttribute("id", user.getId());
		model.addAttribute("email", user.getEmail());
		return "login/socialSignupform";
	} 
	
	//카카오톡
	@RequestMapping("/kakao.json") 
	public @ResponseBody User kakao(User user, Model model) throws Exception { 
		User users = loginService.selectUserById(user.getId());
		System.out.println("kakao 들어옴");
		System.out.println(user.getName());
		System.out.println(user.getId());
		System.out.println(user.getEmail());
		return users;
	} 
	
	
	

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
			session.setMaxInactiveInterval(60 * 60);
			return "redirect:/main/main.do";
		}else {
			attr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다");
			return "redirect:/login/loginForm.do";
		}
	}	

	//로그 아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main.do";
	}	
	
	//회원가입
	@RequestMapping("/signupForm.do") 
	public String signupForm() throws Exception{ 
		return "login/signupForm";
	} 
	
	//ID 중복 체크
	@RequestMapping("/signUpIdCheck.json") 
	public @ResponseBody boolean signUpForm(User user) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getId().equals(users.getId())) {
				return true;
			}
		}
		return false;
	} 	

	//email 중복 체크
	@RequestMapping("/emailCheck.json") 
	public @ResponseBody boolean emailCheck(User user) throws Exception { 
		List<User> list = loginService.selectAllUser();
		for (User users : list) {
			if(user.getEmail().equals(users.getEmail())) {
				return true;
			}
		}
		return false;
	} 	
	
	// 회원가입후 로그인화면 이동
	@RequestMapping("/signup.do") 
	public String signup(User user, RedirectAttributes attr, HttpSession session) throws Exception{ 
		 user.setPassword(passCode.encode(user.getPassword()));
		 loginService.insertMemberInfo(user);
		 new File("c:\\java-lec\\upload\\" + user.getId()).mkdirs();
		 attr.addFlashAttribute("msg", "회원가입이 되었습니다.");
		return "redirect:/login/loginForm.do";
		
	} 
	
	// ID찾기
	@RequestMapping("/fogetId.json") 
	@ResponseBody
	public User fogetId(User user,  RedirectAttributes attr) throws Exception { 
		User userInfo = loginService.selectUserByNameEmail(user);
		if(userInfo != null){
			return userInfo;
		}
		return null;
	}

	
}
