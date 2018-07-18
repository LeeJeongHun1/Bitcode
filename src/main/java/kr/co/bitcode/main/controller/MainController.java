package kr.co.bitcode.main.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.print.attribute.standard.PageRanges;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.DownloadFile;
import kr.co.bitcode.repository.domain.FileVO;
import kr.co.bitcode.repository.domain.Folder;

@Controller
@CrossOrigin(origins = "*")
@RequestMapping("/main")
public class MainController {
	
//	private static final String DELETE_PATH = "c:\\java-lec\\upload\\delete\\";
	private static final String PATH = "c:\\java-lec\\upload\\";
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
	}
	
	@RequestMapping("/selectFolder.json")
	@ResponseBody
	public List<Folder> selectFolder(String id) {
		String folderPath = PATH + id; 
		String musicPath = PATH + "music_" + id;
		System.out.println("경로 : " + folderPath);
		new File(folderPath + "\\새 폴더").mkdirs();
		new File(musicPath + "\\새 폴더").mkdirs();
		return ListDirectory(new File(folderPath));
	}
	
	@RequestMapping("/createFolder.json")
	@ResponseBody
	public List<Folder> createFolder(String path, String id) {
		new File(PATH + id + "/" + path).mkdirs();
		return ListDirectory(new File(PATH + id));
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
	public List<Folder> upload(MultipartFile attach, String id, String parentPath){
		System.out.println("사용자가 올린 파일 이름 : " + attach.getOriginalFilename());
		System.out.println("사용자가 올린 파일 이름1 : " + attach.getName());
		System.out.println("사용자가 올린 파일 타입 : " + attach.getContentType());
		System.out.println("경로 : " + parentPath);
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
		return ListDirectory(new File(PATH + id));
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
//			size += ff.length();
			Folder folder = new Folder();
			String type = new MimetypesFileTypeMap().getContentType(ff);
			if(ff.isFile()){
				if(type.equals("image/jpeg")){
					folder.setType("img");
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
	
	@RequestMapping("/download.do")
	public void download(DownloadFile file, HttpServletResponse response) throws Exception{
		File f = new File(file.getPath() + "\\" + file.getFileName());
		System.out.println(file.getPath());
		System.out.println(file.getFileName());
		String dName = file.getFileName();
//		if(dName == null){
////			헤더값의 설정을 통해서 처리
//			response.setHeader("content-Type", "image/jpg");
//		}
////		파일의 종류에 상관없이 무조건 다운로드
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
}
