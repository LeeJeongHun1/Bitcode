package kr.co.bitcode.music.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.bitcode.repository.domain.Folder;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/music")
public class MusicController {

	private final String PATH = "c:\\java-lec\\upload\\";
	private final String MUSIC_PATH = "_music";
	//@Autowired
	//private MusicService service;
	
	/** 내음악 플레이어 */
	@RequestMapping("/player.do")
	public void player(String id) {
//		File f = new File(MUSIC_PATH + id);
//		for (File music : f.listFiles()) {
//			if(music.isFile()){
//				
//			}
//		}
	}
	
	@RequestMapping("musicList.json")
	@ResponseBody
	public List<Folder> musicList(String id){
		File f = new File(PATH + id + MUSIC_PATH);
		return ListDirectory(f);
	}
	
	
	private List<Folder> ListDirectory(File file, int...args){
//		file.renameTo(dest) 파일 무브 삭제개념
		int i;
		if(args.length == 0){
			i = 1;
		}else{
			i = args[0];
		}
//		long size = 0; 용량 체크
		List<Folder> fList = new ArrayList<>(); 
		for (File ff : file.listFiles()) {
			if(ff.isFile()){
				Folder folder = new Folder();
				folder.setKey(i++);
				folder.setTitle(ff.getName());
				folder.setParentPath(ff.getParent());
				fList.add(folder);
			}
		}
		return fList;
	}
}
