package kr.co.bitcode.remote.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.remote.service.RemoteService;
import kr.co.bitcode.repository.domain.Remote;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/remote")
public class RemoteController {
	private static List<Remote> remoteList = new ArrayList<>();
	
	@Autowired
	private RemoteService service;
	
	@RequestMapping("/list.do")
	public void remoteList() {
	}
	
	@RequestMapping("/insertForm.do")
	public void remoteForm(HttpSession session) {
	}
	
	@RequestMapping("/remote.do")
	public ModelAndView remote(Remote remote, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/remote");
		
		if(remote != null) remoteList.add(remote);
		
		session.setAttribute("remoteList", remoteList);
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
