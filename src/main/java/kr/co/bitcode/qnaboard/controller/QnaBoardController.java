package kr.co.bitcode.qnaboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	//@Autowired
	//private TestService testService;
	
	@RequestMapping("/listBoard.do")
	public ModelAndView listBoard() {
		ModelAndView mav = new ModelAndView("/qnaboard/listBoard");
		return mav;
	}
	
	@RequestMapping("/viewDetail.do")
	public ModelAndView viewDeatil() {
		ModelAndView mav = new ModelAndView("/qnaboard/viewDetail");
		return mav;
	}
	
	@RequestMapping("/editQna.do")
	public ModelAndView editQna() {
		ModelAndView mav = new ModelAndView("/qnaboard/editQna");
		return mav;
	}

}
