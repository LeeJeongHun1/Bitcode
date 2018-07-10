package kr.co.bitcode.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcode.main.service.TestService;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;



	@RequestMapping("/test.do")
	public void test(Model model) {
	}


	@RequestMapping("/test1.do")
	public void test1(Model model) {
	}
}
