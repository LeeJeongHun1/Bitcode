package kr.co.bitcode.codeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.mapper.CodeBoardMapper;
import kr.co.bitcode.repository.mapper.CodeListMapper;

@Service("CodeBoardService")
public class CodeBoardServiceImpl implements CodeBoardService{
	@Autowired
	private CodeBoardMapper mapper;
	private CodeListMapper Cmapper;
	
	@Override
	public List<CodeBoard> selectBoard(){
		return mapper.selectBoard();
	}

	@Override
	public CodeBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}
	
	@Override
	public void insertBoard(CodeBoard cb) {
		mapper.insertBoard(cb);
		
	}

	@Override
	public void updateBoard(CodeBoard cb) {
		mapper.updateBoard(cb);
		
	}

	@Override
	public void deleteBoard(CodeBoard cb) {
		mapper.deleteBoard(cb);
		
	}

	@Override
	public void updateBoardViewCnt(int no) {
		mapper.updateBoardViewCnt(no);
		
	}

	@Override
	public List<Code> selectLanguage() {
		List<Code> list = Cmapper.selectLanguage();
		return list;
	}

}
