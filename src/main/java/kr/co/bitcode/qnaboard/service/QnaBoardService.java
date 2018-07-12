package kr.co.bitcode.qnaboard.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;

public interface QnaBoardService {
	public List<Qna> selectQnaBoard() throws Exception;
	public void updateQna(Qna qna,QnaFile qnafile) throws Exception;
	public void updateQnaView(int no) throws Exception;
	public void insertQna(Qna qna,QnaFile qnafile) throws Exception;
	public List<Qna> detailQna(int no) throws Exception;
	public List<Code> selectLanguage() throws Exception;
	
	// 답글
	public void updateReQna(Qna qna,QnaFile qnafile) throws Exception;
	public void insertReQna(Qna qna,QnaFile qnafile) throws Exception;
}
