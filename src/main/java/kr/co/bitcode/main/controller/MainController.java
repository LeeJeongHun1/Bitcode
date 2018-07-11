package kr.co.bitcode.main.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/main")
public class MainController {
	
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
	}
	
	@RequestMapping("/selectFolder.json")
	@ResponseBody
	public String selectFolder(String id) {
		String folderPath = "c:\\java-lec\\upload\\";
		File f = new File(folderPath + id);
		System.out.println(folderPath + id);
		System.out.println(f.getAbsolutePath());
		System.out.println(f.listFiles().length);
		for (File ff : f.listFiles()) {
			if(ff.isFile()){
				System.out.println("파일 이름 : " + ff.getName());
				System.out.println("파일 크기 : " + ff.length());
			}
			if(ff.isDirectory()){
				System.out.println("폴더 이름 : " + ff.getName());
				System.out.println("폴더 크기 : " + ff.length());
			}
		}
		return f.getAbsolutePath();
	}
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public String upload(MultipartFile attach, String id){
		System.out.println("사용자가 올린 파일 정보 : " + attach.getOriginalFilename());
		try {
			// 실제 서버에 저장하기
			attach.transferTo(new File("c:/java-lec/upload/" + id, attach.getOriginalFilename()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
