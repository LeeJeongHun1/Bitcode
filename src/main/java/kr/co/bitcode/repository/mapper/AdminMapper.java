package kr.co.bitcode.repository.mapper;

public interface AdminMapper {

	// 총 Q&A 갯수
	public int selectQnAAllCnt ();
	// 총 Q&A에 대한 답글 갯수
	public int selectQnAAllAnswerCnt();
	
}
