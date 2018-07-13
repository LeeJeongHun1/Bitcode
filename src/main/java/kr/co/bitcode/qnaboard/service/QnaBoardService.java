package kr.co.bitcode.qnaboard.service;

import java.util.List;
import java.util.Map;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.Search;

public interface QnaBoardService {
	public Map<String,Object> selectQnaBoard(Search search) throws Exception;
	public void updateQna(Qna qna,QnaFile qnafile) throws Exception;
	public void updateQnaView(int no) throws Exception;
	public void insertQna(Qna qna,QnaFile qnafile) throws Exception;
	public Qna detailQna(int no) throws Exception;
	public List<Code> selectLanguage() throws Exception;
	public List<Qna> search(Search search) throws Exception;
	
	// 답글
	public void insertReQna(Qna qna,QnaFile qnafile) throws Exception;
}
