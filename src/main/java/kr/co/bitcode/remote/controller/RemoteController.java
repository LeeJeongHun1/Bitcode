package kr.co.bitcode.remote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcode.remote.service.RemoteService;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/remote")
public class RemoteController {
	
	@Autowired
	private RemoteService service;
	
	@RequestMapping("/remoteList.do")
	public void remoteList() {
	}
	
	@RequestMapping("/remoteForm.do")
	public void remoteForm() {
	}
	
	@RequestMapping("/remote.do")
	public void remote() {
	}
	
	@RequestMapping("/remote2.do")
	public void remote2() {
	}
	
	@RequestMapping("/remote3.do")
	public void remote3() {
	}

}
