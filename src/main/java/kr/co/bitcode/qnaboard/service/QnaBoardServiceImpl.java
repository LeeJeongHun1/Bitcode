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
import kr.co.bitcode.repository.domain.QnaComment;
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
		Qna qna = mapper.selectBoardByNo(no);
		qna.setFileList(mapper.selectQnaFile(no));
		return qna;
	}

/*	@Override
	public Map<String,Object> selectQnaBoard(Search search) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectBoard(search));
		//map.put("pageResult",new PageResult(page.getPageNo(),mapper.selectBoardCount(search,page)));
		return map;
	}*/

	@Override
	public void updateQna(Qna qna, QnaFile qnafile) throws Exception {
		//mapper.updateReBoard(qna.getNo());
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
		mapper.updateReBoard(qna);
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
		}mapper.updateAnswerChange(qna.getNo());
	}

	@Override
	public Map<String,Object> search(Search search) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectBoardSearch(search));
		map.put("pageResult", new PageResult(search.getPageNo(),mapper.searchBoardCount(search)));
		List<Qna> list = mapper.selectBoardSearch(search);
		for(Qna qna:list) {
			System.out.println(qna.getTitle() +"제목");
			System.out.println(qna.getContent() +"내용");
		}
		return map;
	
	}

	@Override
	public Map<String,Object> list(Page page) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectboard(page));
		map.put("pageResult", new PageResult(page.getPageNo(),mapper.selectBoardCount(page)));
		System.out.println(page.getBegin() +"시작");
		System.out.println(page.getEnd() +"끝");
		System.out.println(page.getPageNo());
		return map;
		
	}

	@Override
	public List<QnaComment> commentRegist(QnaComment comment) throws Exception {
		mapper.insertComment(comment);
		System.out.println("댓글적용");
		return mapper.selectComment(comment.getNo());
	}

	@Override
	public void delete(int no) throws Exception {
		System.out.println("게시판 삭제 기능 구현 ");
		mapper.deleteBoard(no);
		mapper.deleteQnaFile(no);
	}
	
	
	
	
	
}