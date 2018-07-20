package kr.co.bitcode.user.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bitcode.login.service.LoginService;
import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.user.service.UserService;


@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LoginService loginService;
	
	
	// PassWord 암호화
	@Autowired
	BCryptPasswordEncoder passCode;
	
	//출석체크
	@RequestMapping("/attend.json")
	@ResponseBody
	public List<Attendance> attend(Attendance attendance) throws Exception {
		
		Attendance attend = new Attendance();
		//디비 저장
		attend.setAttDate(attendance.getAttDate());
		attend.setId(attendance.getId());
		userService.insertAttendance(attend);
		ModelAndView mav = new ModelAndView();
		List<Attendance> attendList =  userService.selectAttendance(attendance.getId());
		
		return attendList;
	}
	//회원정보
	@RequestMapping("/userInfo.do") 	
	public ModelAndView joinForm(String id) throws Exception{ 
		ModelAndView mav = new ModelAndView();
		//한 유저에 대한 질문 List 출력
		List<Qna> qnaList= userService.selectmyQuestion(id);
		// 유저 등급및 포인트 출력
		User userInfo = loginService.selectUserById(id);
		//출첵
		List<Attendance> attendList =  userService.selectAttendance(id);
		mav.setViewName("user/userInfo");
		mav.addObject("qnaList", qnaList);
		mav.addObject("userInfo", userInfo);
		mav.addObject("attendList", attendList);
		
		return mav;
		
		
	} 
	//수정 클릭시
	@RequestMapping("/updateUserForm.do") 
	public String updateUserForm()  { 
		return "user/userUpdate";
	} 
	//일반 유저 수정
	@RequestMapping("/updateUser.do") 
	public String updateUser(User user, RedirectAttributes attr, HttpSession session) throws Exception { 
		userService.updateUser(user);
		User userInfo = loginService.selectUserById(user.getId());	
		session.setAttribute("user", userInfo);
		return "redirect:/user/userInfo.do";
	} 
	
	//비번수정 JSON
	@RequestMapping("/updatePassForm.json") 
	@ResponseBody
	public User updatePassForm(User user, HttpSession session)  throws Exception{ 
		System.out.println(user.getId());
		user.setPassword(passCode.encode(user.getPassword()));
		userService.updateUserPass(user);
		User userInfo = loginService.selectUserById(user.getId());	
		System.out.println(userInfo.getPassword());
		session.setAttribute("user", userInfo);
		
		return user;
	} 
	
	
	
	
	
	
	
	
	
}
