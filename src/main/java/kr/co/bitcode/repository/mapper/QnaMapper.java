package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaComment;
import kr.co.bitcode.repository.domain.QnaFile;

public interface QnaMapper {
	// 게시판 
	public List<Qna> selectBoard();
	public Qna selectBoardByNo(int no);
	public void insertBoard(Qna qna);
	public void updateBoard(Qna qna);
	public void deleteBoard(int no);
	// 페이징
	public int selectBoardCount(Qna qna);	
	// 댓글 
	public void insertComment(QnaComment comment);
	public void updateComment(QnaComment comment);
	public void deleteComment(int commentNo);
	public List<QnaComment> selectComment(int no);
	
	// 첨부파일 
	public void insertQnaFile(QnaFile qnafile);
	public void updateQnaFile(QnaFile qnafile);
	public List<Qna> selectQnaFileByNo(int no);
	//public List<QnaFile> selectQnaFile(int no);
	
}
