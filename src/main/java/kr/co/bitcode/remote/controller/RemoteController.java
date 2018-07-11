package kr.co.bitcode.remote.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.remote.service.RemoteService;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/remote")
public class RemoteController {
	
	@Autowired
	private RemoteService service;
	
	@RequestMapping("/list.do")
	public ModelAndView remoteList(String nickName, String question, String link, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/list");
//		session.setAttribute("nickName", nickName);
//		session.setAttribute("question", question);
//		session.setAttribute("link", link);
//		System.out.println(nickName);
//		System.out.println(question);
//		System.out.println(link);
		return mav;
	}
	
	@RequestMapping("/insertForm.do")
	public void remoteForm(HttpSession session) {
	}
	
	@RequestMapping("/remote.do")
	public ModelAndView remote(String nickName, String question, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/remote");
		session.setAttribute("nickName", nickName);
		session.setAttribute("question", question);
		return mav;
	}
	
	@RequestMapping("/remote2.do")
	public void remote2() {
	}
	
	@RequestMapping("/remote3.do")
	public void remote3() {
	}
	@RequestMapping("/remoteTest.do")
	public void remote4() {
	}

}
