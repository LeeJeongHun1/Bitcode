package kr.co.bitcode.qnaboard.service;

import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.QnaFile;

public interface QnaBoardService {
	public void insertQna(Qna qna,QnaFile qnafile) throws Exception;
}
