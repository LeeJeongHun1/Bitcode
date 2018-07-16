package kr.co.bitcode.qnaboard.service;

import java.util.List;
import java.util.Map;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.Page;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;
import kr.co.bitcode.repository.domain.Search;

public interface QnaBoardService {
	//public Map<String,Object> selectQnaBoard(Search search) throws Exception;
	public void updateQna(Qna qna,QnaFile qnafile) throws Exception;
	public void updateQnaView(int no) throws Exception;
	public void insertQna(Qna qna,QnaFile qnafile) throws Exception;
	public void delete(int no) throws Exception;
	public Qna detailQna(int no) throws Exception;
	public List<Code> selectLanguage() throws Exception;
	public Map<String,Object> list(Page page) throws Exception;
	public Map<String,Object> search(Search search) throws Exception;
	
	// 답글
	public void insertReQna(Qna qna,QnaFile qnafile) throws Exception;
	
	// 댓글
	public List<QnaComment> commentList(int no) throws Exception;
	public List<QnaComment> commentRegist(QnaComment comment) throws Exception;
	public List<QnaComment> commentUpdate(QnaComment comment) throws Exception;
	public List<QnaComment> commentDelete(QnaComment comment) throws Exception;
}
