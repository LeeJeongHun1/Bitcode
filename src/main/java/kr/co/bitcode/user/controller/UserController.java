package kr.co.bitcode.user.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
//	@RequestMapping("/attend.json")
//	@ResponseBody
//	public int attend(Attendance attendance) throws Exception {
//		
//		Attendance attend = new Attendance();
//		//디비 저장
//		attend.setAttDate(attendance.getAttDate());
//		attend.setId(attendance.getId());
//		userService.insertAttendance(attend);
//		
//		return 1;
//	}
	@RequestMapping("/updateAttend.do")
	public ModelAndView updateAttend(String id) throws Exception {
		System.out.println("userId 출첵 폼 : " + id);
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
	
	
	//회원정보
	@RequestMapping("/userInfo.do") 	
	public ModelAndView joinForm(String id) throws Exception{ 
		ModelAndView mav = new ModelAndView();
		//한 유저에 대한 질문 List 출력
		
		List<Qna> qnaList= userService.selectmyQuestion(id);
		// 유저 등급및 포인트 출력
		User userInfo = loginService.selectUserById(id);
		String birth = userInfo.getBirthday();
		String yearId1 = birth.substring(0, 4);
		String monthId1 =birth.substring(4, 6);
		String dateId1 =birth.substring(6);

		//출첵
		List<Attendance> attendList =  userService.selectAttendance(id);
		mav.setViewName("user/userInfo");
		mav.addObject("qnaList", qnaList);
		mav.addObject("userInfo", userInfo);
		mav.addObject("attendList", attendList);
		mav.addObject("yearId1",yearId1);
		mav.addObject("monthId1", monthId1);
		mav.addObject("dateId1", dateId1);
		
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
