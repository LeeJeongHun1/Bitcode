package kr.co.bitcode.codeboard.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcode.codeboard.service.CodeBoardService;
import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;

@Controller
@RequestMapping("/codeboard")
public class CodeBoardController {
	
	@Autowired
	private CodeBoardService service;
	ServletContext servletContext;
	
	@RequestMapping(value="/{pageNo}/board.do", method=RequestMethod.GET)
	public void listboardpage(@PathVariable String PageNo) {
		System.out.println(PageNo);
	}
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String listBoard(CodeBoard cb, Model model) {
		List<CodeBoard> listBoard = service.selectBoard();
		model.addAttribute("list", listBoard);
		return "codeboard/list";
	}
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String detailBoard(int no, Model model) {
		CodeBoard cb = service.selectBoardByNo(no);
		List<CodeBoardFile> cbFileList = service.selectBoardFileByNo(no);
		model.addAttribute("cb", cb);
		model.addAttribute("cbFileList", cbFileList);
		service.updateBoardViewCnt(no);
		return "codeboard/detail";
	}
	
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String insertBoardForm() {
		return "codeboard/insertForm";
	}
	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBoard(CodeBoard cb, CodeBoardFile cbFile) throws Exception {
		service.insertBoard(cb);
		service.updateGroupNo(cb.getNo());
		if(cb.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
			
		for(MultipartFile file:cb.getFile()) {
			file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
			cbFile.setNo(cb.getNo());
			System.out.println(cb.getNo());
			cbFile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
			cbFile.setOriName(file.getOriginalFilename());
			cbFile.setSystemName(file.getName());
			cbFile.setFileSize((int)file.getSize());	
			service.insertBoardFile(cbFile);
			}
		}
		
		 int no = cb.getNo();
		return "redirect:/codeboard/detail.do?no=" +no;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateBoard(CodeBoard cb) {
		service.updateBoard(cb);
		int no = cb.getNo();
		return "redirect:/codeboard/detail.do?no=" +no;
	}
	
	@RequestMapping(value="/updateForm.do", method=RequestMethod.GET)
	public String updateFormBoard(int no, Model model) {
		CodeBoard cb = service.selectBoardByNo(no);		
		model.addAttribute("cb", cb);
		return "codeboard/updateForm";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String deleteboard(int no) {
		service.deleteBoard(no);
		return "redirect:/codeboard/list.do";
	}
	
//	@RequestMapping(value="/reply/{no}", method=RequestMethod.GET)
//	public String prereply(@PathVariable String no, Model model) {
//		CodeBoard cb = service.selectBoardByNo(no);
//		return "codeboard/update";
//	}
	
	@RequestMapping(value="/replyForm.do", method=RequestMethod.GET)
	public String replyForm(int no, Model model) {
		CodeBoard cb = service.selectBoardByNo(no);
		cb.setNo(0);
		cb.setTitle("RE: " + cb.getTitle());
		cb.setContent(cb.getContent());
		model.addAttribute("cb", cb);
		return "codeboard/replyForm";
	}
	
	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public String replyBoard(CodeBoard cb, CodeBoardFile cbFile) {
		service.replyBoard(cb);
		return "redirect:/codeboard/list.do";
	}
	
	@RequestMapping("/selectLanguage.json")
	@ResponseBody
	public List<Code> selectLanguage() throws Exception{
		List<Code> list = service.selectLanguage();
		return list;
	}
	
}
