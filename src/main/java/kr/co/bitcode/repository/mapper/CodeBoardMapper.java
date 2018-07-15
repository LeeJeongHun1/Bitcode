package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;
import kr.co.bitcode.repository.domain.CodeSearch;

public interface CodeBoardMapper {
	public List<CodeBoard> selectBoard(CodeSearch cs);
	public CodeBoard selectBoardByNo(int no);
	public void insertBoard(CodeBoard cb);
	public void updateBoard(CodeBoard cb);
	public void deleteBoard(int no);
	public void updateBoardViewCnt(int no);
	public List<CodeBoardFile> selectBoardFileByNo(int no);
	public void insertBoardFile(CodeBoardFile cbFile);
	public void updateGroupNo(int no);
	public void updateGroupOrder(CodeBoard cb);
	public void replyBoard(CodeBoard cb);
}
