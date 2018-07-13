package kr.co.bitcode.qnaboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.qnaboard.service.QnaBoardService;
import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;

@Controller
@RequestMapping("/qnaboard")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping("/list.do")
	public ModelAndView listBoard() throws Exception {
		ModelAndView mav = new ModelAndView("qnaboard/list");
		mav.addObject("list", qnaBoardService.selectQnaBoard());
		return mav;
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView viewDeatil(int no) throws Exception {
		ModelAndView mav = new ModelAndView("qnaboard/detail");
		System.out.println(no +"글번호");
		mav.addObject("list", qnaBoardService.detailQna(no));
		return mav;
	}	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String editQna(Qna qna,QnaFile qnafile) throws Exception {
		qnaBoardService.insertQna(qna, qnafile);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String editQna() throws Exception {
		return "qnaboard/insertForm";
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateQna(Qna qna,QnaFile qnafile) throws Exception {
		qnaBoardService.updateQna(qna, qnafile);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/updateForm.do", method=RequestMethod.GET)
	public String updateQna(int no,Model model) throws Exception {
		model.addAttribute("list", qnaBoardService.detailQna(no));
		return "qnaboard/updateForm";
	}
	
	@RequestMapping(value="/insertRe.do",method=RequestMethod.POST)
	public String editReQna(Qna qna,QnaFile qnafile) throws Exception {
		System.out.println("가는지");
		qnaBoardService.insertReQna(qna, qnafile);
		return "redirect:/qnaboard/list.do";
	}
	
	@RequestMapping(value="/insertReForm.do", method=RequestMethod.GET)
	public String editReQna(int no,Model model) throws Exception{
		model.addAttribute("list", qnaBoardService.detailQna(no));
		return "qnaboard/insertReForm";
	}
	
	@RequestMapping("/selectLanguage.json")
	@ResponseBody
	public List<Code> selectLanguage() throws Exception{
		List<Code> list = qnaBoardService.selectLanguage();
		System.out.println(list.get(1).getCode());
		return list;
	}
	
	
}
