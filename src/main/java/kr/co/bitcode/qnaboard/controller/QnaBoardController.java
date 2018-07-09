package kr.co.bitcode.qnaboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	//@Autowired
	//private TestService testService;
	
	@RequestMapping("/list.do")
	public ModelAndView listBoard() {
		ModelAndView mav = new ModelAndView("/qnaboard/list");
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView viewDeatil() {
		ModelAndView mav = new ModelAndView("/qnaboard/detail");
		return mav;
	}
	
	@RequestMapping("/insert.do")
	public ModelAndView editQna() {
		ModelAndView mav = new ModelAndView("/qnaboard/insertForm");
		return mav;
	}

}
