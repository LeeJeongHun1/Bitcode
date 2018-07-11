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
		CodeBoardFile cbFile = service.selectBoardFileByNo(no);
		model.addAttribute("cb", cb);
		model.addAttribute("cbFile", cbFile);
		service.updateBoardViewCnt(no);
		return "codeboard/detail";
	}
	
	@RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
	public String insertBoardForm() {
		return "codeboard/insertForm";
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertBoard(CodeBoard cb, MultipartHttpServletRequest mRequest) throws Exception {		
//		String uploadDir = servletContext.getRealPath("/upload");
//		ModelAndView mav = new ModelAndView("redirect:/codeboard/detail.do?no=" +no);
		
		Iterator<String> iter = mRequest.getFileNames();
		while(iter.hasNext()) {
			
			String formFileName = iter.next();
			SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
			String datePath = sdf.format(new Date());
			MultipartFile mFile = mRequest.getFile(formFileName);
			
			String oriFileName = mFile.getOriginalFilename();
			System.out.println("원본 파일명 : " + oriFileName);
			
			if(oriFileName != null && !oriFileName.equals("")) {
			
				
				String ext = "";
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					ext = oriFileName.substring(index);
				}				
				long fileSize = mFile.getSize();
				System.out.println("파일 사이즈 : " + fileSize);
				
				String saveFileName = "mlec-" + UUID.randomUUID().toString() + ext;
				System.out.println("저장할 파일명 : " + saveFileName);
			
				mFile.transferTo(new File("d:/java-lec/upload/" + saveFileName));
				
				CodeBoardFile cbFile = new CodeBoardFile();
				cbFile.setFileNo(cb.getNo());
				cbFile.setFilePath(datePath);
				cbFile.setOriName(oriFileName);
				cbFile.setSystemName(saveFileName);
				cbFile.setFileSize(fileSize);
				service.insertBoardFile(cbFile);
			} 
		}
		
		service.insertBoard(cb);
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
