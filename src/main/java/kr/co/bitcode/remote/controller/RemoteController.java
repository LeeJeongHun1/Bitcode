package kr.co.bitcode.remote.controller;

import java.util.ArrayList;
import java.util.HashSet;
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
	public ModelAndView remoteList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/list");
		mav.addObject("remoteList", remoteList);
		return mav;
	}
	
	@RequestMapping("/insertForm.do")
	public void remoteForm(HttpSession session) {
	}
	
	@RequestMapping("/remote.do")
	public ModelAndView remote(String question, String nickName, String id, String link, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/remote");
		
		System.out.println(nickName);
		
		if(id != null) session.setAttribute("id", id);
		if(nickName != null) session.setAttribute("nickName", nickName);
		if(question != null) session.setAttribute("question", question);
		if(link != null) session.setAttribute("link", link);
		
		Remote remote = new Remote();
		remote.setId(id);
		remote.setNickName(nickName);
		remote.setQuestion(question);
		remote.setLink(link);
		
		// 모든 파라미터의 값이 있을 때
		if(remote.getId() != null && remote.getNickName() != null && remote.getQuestion() != null && remote.getLink() != null) {
			// ID가 같을 경우 기존 상담정보를 갱신
			for(Remote r : remoteList) {
				if(r.getId().equals(id)) {
					r.setId(id);
					r.setLink(link);
					r.setNickName(nickName);
					r.setQuestion(question);
					System.out.println("상담신청 갱신");
				}
			}
			remoteList.add(remote);
		}
		System.out.println(remote);
		session.setAttribute("remoteList", remoteList);				
		return mav;
	}
	
	@RequestMapping("/remoteDel.do")
	public void remoteDel(String id) {
		System.out.println("idididididididiiddi");
		// 상담 종료시 삭제
		for(int i=0 ; i<remoteList.size() ; i++) {
			Remote r = remoteList.get(i);
			if(r.getId().equals(id)) {
				remoteList.remove(i);
			}
		}
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
