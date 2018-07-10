package kr.co.bitcode.qnaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.qnaboard.service.QnaBoardService;
import kr.co.bitcode.repository.domain.Code;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
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
	
	@RequestMapping("/selectLanguage.json")
	public List<Code> selectLanguage() throws Exception{
		List<Code> list = qnaBoardService.selectLanguage();
		System.out.println(list.size());
		return list;
	}

}
