package kr.co.bitcode.codeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/codeboard")
public class CodeBoardController {

	@RequestMapping(value="/{pageNo}/Board.do", method=RequestMethod.GET)
	public void listboard(@PathVariable String PageNo) {
		System.out.println(PageNo);
	}
	@RequestMapping(value="/Board.do", method=RequestMethod.GET)
	public String detailboard() {
		return "codeboard/listBoard";
	}
	@RequestMapping(value="/Board.do", method=RequestMethod.PATCH)
	public void updateboard() {
		
	}
	@RequestMapping(value="/Board.do", method=RequestMethod.DELETE)
	public void deleteboard() {
		
	}
}
