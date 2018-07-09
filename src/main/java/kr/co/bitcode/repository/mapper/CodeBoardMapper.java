package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.CodeBoard;

public interface CodeBoardMapper {
	public List<CodeBoard> selectBoard();
	public CodeBoard selectBoardByNo(int no);
	public void insertBoard(CodeBoard cb);
	public void updateBoard(CodeBoard cb);
	public void deleteBoard(CodeBoard cb);
	public void updateBoardViewCnt(int no);
}
