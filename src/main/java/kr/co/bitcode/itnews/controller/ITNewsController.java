package kr.co.bitcode.itnews.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.crawling.service.CrawlingService;
import kr.co.bitcode.repository.domain.Article;

@Controller
@RequestMapping("/itnews")
public class ITNewsController {
	
	@Autowired
	private CrawlingService crawlingService;
	
	// IT 뉴스 출력하기
	@RequestMapping("/itnews.do")
	public ModelAndView newsList() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Article> newList = crawlingService.selectITNews();
		
		mav.setViewName("itnews/list");
		mav.addObject("newList", newList);
		return mav;
	}
	
	
	
	@RequestMapping("/itnewsDetail.do") 
	public String itnewsDetail(int articleNo) { 
		return "itnews/detail";
	} 
}
