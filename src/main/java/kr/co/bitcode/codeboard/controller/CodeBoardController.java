package kr.co.bitcode.codeboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.bitcode.codeboard.service.CodeBoardService;
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
	public String detailBoard() {
		return "codeboard/detail";
	}
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String insertBoardForm() {
		return "codeboard/insertForm";
	}
	
	@RequestMapping(value="/board.do", method=RequestMethod.PATCH)
	public void updateboard() {
		
	}
	@RequestMapping(value="/board.do", method=RequestMethod.DELETE)
	public void deleteboard() {
		
	}
}
