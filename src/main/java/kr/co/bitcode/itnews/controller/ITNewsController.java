package kr.co.bitcode.itnews.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/itnews")
public class ITNewsController {
	
	@RequestMapping("/itnews.do") 
	public String itnews() { 
		return "itnews/itNewsForm";
	} 

}
