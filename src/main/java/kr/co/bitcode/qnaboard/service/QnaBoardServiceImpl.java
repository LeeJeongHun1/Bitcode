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
		System.out.println("번호"+ qna.getNo());
		for(MultipartFile file:qna.getFile()) {
		file.transferTo(new File("c:/java-lec/upload/"+file.getOriginalFilename()));
		qnafile.setNo(qna.getNo());
		qnafile.setFilePath("c:/java-lec/upload/"+file.getOriginalFilename());
		qnafile.setOriName(file.getOriginalFilename());
		qnafile.setSystemName(file.getName());
		qnafile.setFileSize((int)file.getSize());	
		} 	
		mapper.insertQnaFile(qnafile);
	}

	@Override
	public List<Code> selectLanguage() throws Exception {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}

	@Override
	public Qna detailQna(int no) throws Exception {
		Qna qna = mapper.selectBoardByNo(no);
		System.out.println(qna.getContent() +"내용");
		System.out.println(qna.getFilePath() +"파일");
		return qna;
	}
	
	
	
	
	
}
