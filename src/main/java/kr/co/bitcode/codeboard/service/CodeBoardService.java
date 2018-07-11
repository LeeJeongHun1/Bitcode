package kr.co.bitcode.codeboard.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;

public interface CodeBoardService {
	public List<CodeBoard> selectBoard();
	public CodeBoard selectBoardByNo(int no);
	public void insertBoard(CodeBoard cb);
	public void updateBoard(CodeBoard cb);
	public void deleteBoard(CodeBoard cb);
	public void updateBoardViewCnt(int no);
	public List<Code> selectLanguage();
	public CodeBoardFile selectBoardFileByNo(int no);
	public void insertBoardFile(CodeBoardFile cbFile);
}
