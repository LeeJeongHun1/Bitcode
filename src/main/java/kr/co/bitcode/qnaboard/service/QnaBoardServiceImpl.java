package kr.co.bitcode.qnaboard.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;
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
	public List<Qna> detailQna(int no) throws Exception {
		List<Qna> list = mapper.selectBoardByNo(no);
		return list;
	}

	@Override
	public List<Qna> selectQnaBoard() throws Exception {
		List<Qna> list = mapper.selectBoard();
		return list;
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

	/*@Override
	public void insertReQna(Qna qna, QnaFile qnafile) throws Exception {
		mapper.insertReBoard(qna);
		mapper.insertQnaFile(qnafile);
		mapper.updateReBoard(qna.getGroupNo());
	}*/
	
	
	
	
	
}