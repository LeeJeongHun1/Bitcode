package kr.co.bitcode.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/management.do") 
	public ModelAndView updateUserForm()  {
		ModelAndView mav = new ModelAndView();
		int allCnt = service.selectQnAAllCnt();
		int ansCnt = service.selectQnAAllAnswerCnt();
		
		mav.setViewName("admin/management");
		mav.addObject("allCnt", allCnt);
		mav.addObject("ansCnt", ansCnt);
		return mav;
	} 
}
