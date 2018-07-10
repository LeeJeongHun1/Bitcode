package kr.co.bitcode.qnaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		mapper.insertQnaFile(qnafile);
	}

	@Override
	public List<Code> selectLanguage() throws Exception {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}
	
	
	
	
	
}
