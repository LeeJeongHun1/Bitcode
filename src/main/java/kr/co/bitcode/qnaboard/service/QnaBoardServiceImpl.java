package kr.co.bitcode.qnaboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.mapper.QnaMapper;

@Service("QnaBoardService")
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public void insertQna(Qna qna, QnaFile qnafile) throws Exception {
		mapper.insertBoard(qna);
		mapper.insertQnaFile(qnafile);
	}
	
	
	
	
}
