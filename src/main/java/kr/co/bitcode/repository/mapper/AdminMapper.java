package kr.co.bitcode.repository.mapper;

public interface AdminMapper {

	// 총 Q&A 갯수
	public int selectQnAAllCnt ();
	// 총 Q&A에 대한 답글 갯수
	public int selectQnAAllAnswerCnt();
	// C 문의글 갯수
	public Integer selectQnACCnt();
	// Java 문의글 갯수
	public Integer selectQnAJavaCnt();
	// Java 문의글 갯수
	public Integer selectQnAJavaScriptCnt();
	// Python 문의글 갯수
	public Integer selectQnAPythonCnt();
	// ASP 문의글 갯수
	public Integer selectQnAASPCnt();
	// PHP 문의글 갯수
	public Integer selectQnAPHPCnt();
	
}
