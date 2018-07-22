package kr.co.bitcode.main.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/main")
public class MainController {
	
//	private static final String DELETE_PATH = "c:\\java-lec\\upload\\delete_";
	private final String PATH = "c:\\java-lec\\upload\\";
	private final String MUSIC_PATH = "_music";
	private final String[] EXT = { "jpg", "png", "gif",};
//	private static long FolderSize = 0;
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
	}
		
	// 메모장 내용 읽기
	@RequestMapping("/myNote.json")
	@ResponseBody
	public String myNote(String id) throws Exception {
		// 사용자 txt 파일
		File txt = new File(PATH + id + ".txt", "");
		// 없으면 만들기
		if(!txt.exists()) {
			txt.createNewFile();
		}
		// txt 파일 읽기
		String myTxt = "";
		String temp;
		
		BufferedReader br = new BufferedReader(new FileReader(txt));
        while ((temp = br.readLine()) != null) {
      	  myTxt += temp + "/r/n";
        }

		br.close();
		
		System.out.println("myTxt : " + myTxt);
		return myTxt;
		
	}
}
