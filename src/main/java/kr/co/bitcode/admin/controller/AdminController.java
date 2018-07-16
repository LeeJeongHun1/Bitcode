package kr.co.bitcode.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.admin.service.AdminService;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService service;
	
	/** 관리자 페이지 */
	@RequestMapping("/management.do") 
	public void updateUserForm()  {
	} 
	
	@RequestMapping("/answerCnt.json")
	@ResponseBody
	public Map<String, Integer> answerCnt() {
		return service.answerCnt();
	}
	
}
