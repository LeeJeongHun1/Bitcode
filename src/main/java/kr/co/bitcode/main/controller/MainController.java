package kr.co.bitcode.main.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.DownloadFile;
import kr.co.bitcode.repository.domain.Folder;

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
	
	@RequestMapping("/selectFolder.json")
	@ResponseBody
	public Map<String, Object> selectFolder(String id) {
		String folderPath = PATH + id; 
		String musicPath = PATH + id + MUSIC_PATH;
		String deletePath = PATH + id + "_delete";
		System.out.println("경로 : " + folderPath);
		new File(folderPath + "\\새 폴더").mkdirs();
		new File(deletePath).mkdirs();
		new File(musicPath + "\\새 폴더").mkdirs();
		Map<String, Object> map = new HashMap<>();
		map.put("size", ListDirectorySize(new File(folderPath)));
		map.put("list", ListDirectory(new File(folderPath)));
		return map;
	}
	
	@RequestMapping("/createFolder.json")
	@ResponseBody
	public List<Folder> createFolder(String path, String id) {
		//  폴더만 업로드 할 경우
		System.out.println(path);
		System.out.println(id);
		new File(PATH + id + "/" + path).mkdirs();
		return ListDirectory(new File(PATH + id));
	}
	
	@RequestMapping("/contextFolder.json")
	@ResponseBody
	public Map<String, Object> contextFolder(String path, String name, String id) {
		// 우클릭으로 폴더 추가시
		System.out.println(path);
		System.out.println(name);
		new File(path + "\\" + name).mkdirs();
		Map<String, Object> map = new HashMap<>();
		map.put("fancyList", ListDirectory(new File(PATH + id)));
		map.put("path", path);
		return map;
	}
	
	@RequestMapping("/delete.json")
	@ResponseBody
	public Map<String, Object> delete(String path, String name, String id) {
		System.out.println(path);
		System.out.println(name);
		System.out.println(id);
		new File(path + "/" + name).delete();
		Map<String, Object> map = new HashMap<>();
		map.put("fancyList", ListDirectory(new File(PATH + id)));
		map.put("path", path);
		return map;
	}
	
	@RequestMapping("/enterDirectory.json")
	@ResponseBody
	public List<Folder> enterDirectory(String parentPath, String key){
		System.out.println(parentPath);
		System.out.println(key);
		
		return ListDirectory(new File(parentPath), Integer.parseInt(key));
	}
	
	@RequestMapping("/lazyLoad.json")
	@ResponseBody
	public List<Folder> lazyLoad(String parentPath, String key, String title){
		System.out.println(parentPath);
		System.out.println(key);
		return ListDirectory(new File(parentPath + "\\" + title), Integer.parseInt(key));
	}
	
	@RequestMapping("/upload.json")
	@ResponseBody
	public Map<String, Object> upload(MultipartFile attach, String id, String parentPath){
		System.out.println("사용자가 올린 파일 이름 : " + attach.getOriginalFilename());
		System.out.println("사용자가 올린 파일 이름1 : " + attach.getName());
		System.out.println("사용자가 올린 파일 타입 : " + attach.getContentType());
		System.out.println("경로 : " + parentPath);
		Map<String, Object> map = new HashMap<>();

		try {
//			if(parentPath == null) {
//				attach.transferTo(new File(PATH + id, attach.getOriginalFilename()));
//				return "";
//			}else {
//			}
			// 실제 서버에 업로드 (경로없으면 폴더 생성 후 파일 업로드)
			File create = new File(parentPath, attach.getOriginalFilename());
			create.mkdirs();
			attach.transferTo(create);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("list", ListDirectory(new File(PATH + id)));
		map.put("size", ListDirectorySize(new File(PATH + id)));
		return map;
	}
	
	
	//----------------------------------------music폴더 관리
	@RequestMapping("/musicFolder.json")
	@ResponseBody
	public List<Folder> musicFolder(String id) {
		// 우클릭으로 폴더 추가시
//		new File(path + "\\" + name).mkdirs();
		return ListDirectory(new File(PATH + id + MUSIC_PATH));
	}
	
	
	// 루트 폴더 읽기
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
//			size += ff.length();
			Folder folder = new Folder();
			String type = ff.getName().substring(ff.getName().lastIndexOf(".") + 1, ff.getName().length());
			if(ff.isFile()){
				for(int j=0; j<EXT.length; j++){
					if(type.equalsIgnoreCase(EXT[j])){
						folder.setType("img");
					}
				}
				folder.setKey(i++);
				folder.setTitle(ff.getName());
				folder.setParentPath(ff.getParent());
			}
			if(ff.isDirectory()){
				folder.setKey(i++);
				folder.setTitle(ff.getName());
				folder.setFolder(true);
				folder.setParentPath(ff.getParent());
				if(ff.listFiles().length != 0){
					folder.setLazy(true);
				}
			}
			fList.add(folder);
		}
		return fList;
	}
	
	
	private static long ListDirectorySize(File file){
		long FolderSize = 0;
		for (File ff : file.listFiles()) {
			if(ff.isFile()){
				FolderSize += ff.length();
			}
			if(ff.isDirectory()) {
				ListDirectorySize(ff);
			}
		}
		return FolderSize;
	}
	
	@RequestMapping("/download.do")
	public void download(DownloadFile file, HttpServletResponse response) throws Exception{
		System.out.println(file.getPath());
		System.out.println(file.getFileName());
		File f = new File(file.getPath() + "\\" + file.getFileName());
		String dName = file.getFileName();
//		if(dName == null){
//			헤더값의 설정을 통해서 처리
//			response.setHeader("content-Type", "image/jpg");
//		}
//			파일의 종류에 상관없이 무조건 다운로드
//		else{
//			타입을 모른다. 다운로드 하세요...
		response.setHeader("content-Type", "application/octet-stream");
//			다운로드 받을 이름을 설정
//			dName 한글처리
		dName = new String(dName.getBytes("utf-8"), "8859_1");
		response.setHeader("content-Disposition", "attachment;filename="+dName);
//		}
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while(true){
			int ch = bis.read();
			if (ch == -1) break;
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
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
