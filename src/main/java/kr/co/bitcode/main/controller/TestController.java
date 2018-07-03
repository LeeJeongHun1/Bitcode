package kr.co.bitcode.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.bitcode.main.service.TestService;

@Controller
@RequestMapping("/main")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/test.do")
	public void test(Model model) {
		model.addAttribute("test", testService.test());
	}

}
