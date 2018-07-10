package kr.co.bitcode.codeboard.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.codeboard.service.CodeBoardService;
import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;

@Controller
@RequestMapping("/codeboard")
public class CodeBoardController {
	
	@Autowired
	private CodeBoardService service;
	
	@RequestMapping(value="/{pageNo}/board.do", method=RequestMethod.GET)
	public void listboardpage(@PathVariable String PageNo) {
		System.out.println(PageNo);
	}
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String listboard(CodeBoard cb, Model model) {
		List<CodeBoard> listBoard = service.selectBoard();
		model.addAttribute("list", listBoard);
		return "codeboard/list";
	}
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detailBoard(int no, Model model) {
		CodeBoard cb = service.selectBoardByNo(no);
		model.addAttribute("cb", cb);
		service.updateBoardViewCnt(no);
		return "codeboard/detail";
	}
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String insertBoardForm() {
		return "codeboard/insertForm";
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBoard(CodeBoard cb) throws Exception {		


		service.insertBoard(cb);
		 int no = cb.getNo();
		return "redirect:/codeboard/detail.do?no=" +no;
	}
	
	@RequestMapping(value="/board.do", method=RequestMethod.PATCH)
	public void updateboard() {
		
	}
	@RequestMapping(value="/board.do", method=RequestMethod.DELETE)
	public void deleteboard() {
		
	}
	
	@RequestMapping("/selectLanguage.json")
	@ResponseBody
	public List<Code> selectLanguage() throws Exception{
		List<Code> list = service.selectLanguage();
		return list;
	}
}
