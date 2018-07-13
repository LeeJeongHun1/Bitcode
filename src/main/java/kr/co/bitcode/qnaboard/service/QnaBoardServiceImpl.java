package kr.co.bitcode.qnaboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Page;
import kr.co.bitcode.repository.domain.PageResult;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.Search;
import kr.co.bitcode.repository.mapper.CodeListMapper;
import kr.co.bitcode.repository.mapper.QnaMapper;

@Service("QnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaMapper mapper;
	
	@Autowired
	private CodeListMapper Cmapper;

	@Override
	public void insertQna(Qna qna, QnaFile qnafile) throws Exception {
		mapper.insertBoard(qna);
		mapper.updateGroupNo(qna.getNo());
		System.out.println("번호"+ qna.getNo());
		System.out.println(qna.getFile()[0].getSize() +"갯수");
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.insertQnaFile(qnafile);}
		} 	
	}

	@Override
	public List<Code> selectLanguage() throws Exception {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}

	@Override
	public Qna detailQna(int no) throws Exception {
		System.out.println("파일리스트");
		Qna qna = mapper.selectBoardByNo(no);
		qna.setFileList(mapper.selectQnaFile(no));
		System.out.println("테스트");
		return qna;
	}

	@Override
	public Map<String,Object> selectQnaBoard(Search search) throws Exception {
		System.out.println(search.getKeyword() +"검색어");
		System.out.println(search.getContent()+"??");
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectBoard(search));
		for(String value:map.keySet()) {
			System.out.println("값"+value);
		}
		System.out.println(map.get("list") +"넘어오는지");
		//map.put("pageResult",new PageResult(page.getPageNo(),mapper.selectBoardCount(search,page)));
		return map;
	}

	@Override
	public void updateQna(Qna qna, QnaFile qnafile) throws Exception {
		//mapper.updateReBoard(qna.getNo());
		System.out.println(qna.getContent() +"컨텐츠");
		System.out.println(qna.getTitle() +"제목");
		System.out.println(qna.getCode() + "코드번호");
		System.out.println(qna.getFile().length +"파일 갯수");
		mapper.updateBoard(qna);
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.updateQnaFile(qnafile);}
		} 	
	}

	@Override
	public void updateQnaView(int no) throws Exception {
		mapper.selectBoardByNo(no);
		mapper.selectQnaFileByNo(no);		
	}

	@Override
	public void insertReQna(Qna qna, QnaFile qnafile) throws Exception {
		System.out.println("가냐");
		mapper.updateReBoard(qna);
		System.out.println(qna.getGroupNo() +"그룹번호");
		mapper.insertReBoard(qna);
		if(qna.getFile()[0].getSize() == 0) {
			System.out.println("파일없음");
		}else {
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		mapper.updateQnaFile(qnafile);}
		} 	
	}

	@Override
	public List<Qna> search(Search search) throws Exception {
		List<Qna> list = mapper.selectBoard(search);
		for(Qna qna:list) {
			System.out.println(qna.getContent() +"내용");
		}
		return list;
	
	}
	
	
	
	
	
}