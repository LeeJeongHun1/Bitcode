package kr.co.bitcode.main.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.Children;
import kr.co.bitcode.repository.domain.Folder;

@Controller
@RequestMapping("/main")
public class MainController {
	
	private static final String DELETE_PATH = "c:\\java-lec\\upload\\delete";
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
	}
	
	@RequestMapping("/selectFolder.json")
	@ResponseBody
	public List<Folder> selectFolder(String parentPath, String id) {
		String folderPath = "";
		if(parentPath == null){
			folderPath = "c:\\java-lec\\upload\\" + id;
		}else{
			folderPath = parentPath;
		}
		File f = new File(folderPath);
//		System.out.println(f.listFiles().length);
//		int i = 1;
//		List<Folder> fList = new ArrayList<>(); 
//		for (File ff : f.listFiles()) {
//			Folder folder = new Folder();
//			if(ff.isFile()){
//				folder.setKey(i++);
//				folder.setTitle(ff.getName());
//				folder.setParentPath(ff.getParent());
////				ff.ex
////				folder.setType(type);
//				System.out.println("파일 이름 : " + ff.getName());
//				System.out.println("파일 크기 : " + ff.length());
//			}
//			if(ff.isDirectory()){
////				List<Children> cList = new ArrayList<>();
////				for (File df : ff.listFiles()) {
////					Children c = new Children(); 
////					System.out.println("파일 경로 : " + ff.getPath() + df.getPath());
////					c.setKey(i++);
////					c.setTitle(df.getName());
////					cList.add(c);
////				}
////				folder.setChildren(cList);
//				folder.setKey(i++);
//				folder.setTitle(ff.getName());
//				folder.setFolder(true);
//				folder.setParentPath(ff.getParent());
//				if(ff.listFiles().length != 0){
//					folder.setLazy(true);
//				}
//				System.out.println("폴더 이름 : " + ff.getName());
//				System.out.println("폴더 크기 : " + ff.length());
//			}
//			fList.add(folder);
//		}
//		return fList;
		return ListDirectory(f);
	}
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public String upload(MultipartFile attach, String id, String parentPath){
		System.out.println("사용자가 올린 파일 정보 : " + attach.getOriginalFilename());
		try {
			// 실제 서버에 저장하기
			attach.transferTo(new File("c:/java-lec/upload/" + id, attach.getOriginalFilename()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "c:/java-lec/upload/" + id;
	}
	
	
	@RequestMapping("/enterDirectory.json")
	@ResponseBody
	public String enterDirectory(String parentPath, String key){
		return parentPath;
	}
	
	
	private List<Folder> ListDirectory(File file, int...args){
//		file.renameTo(dest) 파일 무브 삭제개념
		int i;
		if(args.length == 0){
			i = 0;
		}else{
			i = args[0];
		}
//		System.out.println(file.length());
		long size = 0;
		List<Folder> fList = new ArrayList<>(); 
		for (File ff : file.listFiles()) {
			size += ff.length();
			Folder folder = new Folder();
			if(ff.isFile()){
				folder.setKey(i++);
				folder.setTitle(ff.getName());
				folder.setParentPath(ff.getParent());
//				folder.setType(type);
//				System.out.println("파일 이름 : " + ff.getName());
//				System.out.println("파일 크기 : " + ff.length());
			}
			if(ff.isDirectory()){
//				List<Children> cList = new ArrayList<>();
//				for (File df : ff.listFiles()) {
//					Children c = new Children(); 
//					System.out.println("파일 경로 : " + ff.getPath() + df.getPath());
//					c.setKey(i++);
//					c.setTitle(df.getName());
//					cList.add(c);
//				}
//				folder.setChildren(cList);
				folder.setKey(i++);
				folder.setTitle(ff.getName());
				folder.setFolder(true);
				folder.setParentPath(ff.getParent());
				if(ff.listFiles().length != 0){
					folder.setLazy(true);
				}
//				System.out.println("폴더 이름 : " + ff.getName());
//				System.out.println("폴더 크기 : " + ff.length());
			}
			fList.add(folder);
		}
		return fList;
	}
}
