package kr.co.bitcode.remote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcode.remote.service.RemoteService;

@Controller
@RequestMapping("/remote")
public class RemoteController {
	
	@Autowired
	private RemoteService service;
	
	@RequestMapping("/list.do")
	public void remoteList() {
	}
	
	@RequestMapping("/remoteForm.do")
	public void remoteForm() {
	}

}
