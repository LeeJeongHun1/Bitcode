package kr.co.bitcode.remote.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/** 상담신청 리스트 */
	@RequestMapping("/list.do")
	public ModelAndView remoteList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/list");
		mav.addObject("remoteList", remoteList);
		return mav;
	}
	
	/** 상담신청 폼 */
	@RequestMapping("/insertForm.do")
	public void remoteForm(HttpSession session) {
	}
	
	/** 상담화면 */
	@RequestMapping("/remote.do")
	public ModelAndView remote(Remote remote, HttpSession session, @RequestParam(value="remoteDel", defaultValue="N") String remoteDel) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("remote/remote");
		
		System.out.println("remoteDel : " + remoteDel);
		
		// 상담 종료시
		if(remoteDel.equals("Y")) {
			for(int i=0 ; i<remoteList.size() ; i++) {
				Remote r = remoteList.get(i);
				if(r.getId().equals(remote.getId())) {
					remoteList.remove(i);
					System.out.println("리스트 제거");
					//mav.setViewName("remote/list");
					//mav.setViewName("redirect:/remote/list.do");
					session.setAttribute("remoteList", remoteList);				
					return mav;
				}
			}
		}
		// 상담 추가
		else {
			if(remote.getId() != null) session.setAttribute("id", remote.getId());
			if(remote.getNickName() != null) session.setAttribute("nickName", remote.getNickName());
			if(remote.getQuestion() != null) session.setAttribute("question", remote.getQuestion());
			if(remote.getLink() != null) session.setAttribute("link", remote.getLink());
			/*
			Remote remote = new Remote();
			remote.setId(id);
			remote.setNickName(nickName);
			remote.setQuestion(question);
			remote.setLink(link);
			 */
			// 모든 파라미터의 값이 있을 때
			if(remote.getId() != null && remote.getNickName() != null && remote.getQuestion() != null && remote.getLink() != null) {
				if(remoteList.isEmpty()) {
					remoteList.add(remote);
					System.out.println("리스트 새로 추가");
				}else {
					for(Remote r : remoteList) {
						// ID가 같을 경우 기존 상담정보를 갱신
						if(r.getId().equals(remote.getId())) {
							r = remote;
							System.out.println("리스트 중복 정리");
						}else {
							// ID가 다를 경우 리스트에 새로 추가
							remoteList.add(remote);
							System.out.println("리스트 추가");
						}
					} // for
				}
			} // if
			
		}
		session.setAttribute("remoteList", remoteList);				
		return mav;
	}
	/*
	*//** 상담종료시 리스트에서 삭제 *//*
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
	*/
	@RequestMapping("/remoteTest.do")
	public void remote4() {
	}

}
