package kr.co.bitcode.codeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/codeboard")
public class CodeBoardController {

	@RequestMapping(value="/{pageNo}/board.do", method=RequestMethod.GET)
	public void listboardpage(@PathVariable String PageNo) {
		System.out.println(PageNo);
	}
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String listboard() {
		return "codeboard/listBoard";
	}
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detailBoard() {
		return "codeboard/detailBoard";
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
