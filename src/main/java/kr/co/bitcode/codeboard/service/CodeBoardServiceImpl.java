package kr.co.bitcode.codeboard.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Code;
import kr.co.bitcode.repository.domain.CodeBoard;
import kr.co.bitcode.repository.domain.CodeBoardFile;
import kr.co.bitcode.repository.domain.CodeBoardLike;
import kr.co.bitcode.repository.domain.CodeSearch;
import kr.co.bitcode.repository.mapper.CodeBoardMapper;
import kr.co.bitcode.repository.mapper.CodeListMapper;

@Service("CodeBoardService")
public class CodeBoardServiceImpl implements CodeBoardService{
	@Autowired
	private CodeBoardMapper mapper;
	private CodeListMapper Cmapper;
	
	@Override
	public CodeBoard selectBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}
	
	@Override
	public void insertBoard(CodeBoard cb) {
//		System.out.println("sessionnnnnnnnnnnnn"+session);
//		String id = (String) session.getAttribute("id");
//		System.out.println("idddddddddddddddddddddddddddd"+id);
//		cb.setId(id);
		mapper.insertBoard(cb);
		
	}

	@Override
	public void updateBoard(CodeBoard cb) {
		mapper.updateBoard(cb);
		
	}

	@Override
	public void deleteBoard(int no) {
		mapper.deleteBoard(no);
		
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

	@Override
	public List<CodeBoardFile> selectBoardFileByNo(int no) {
		return mapper.selectBoardFileByNo(no);
	}

	@Override
	public void insertBoardFile(CodeBoardFile cbFile) {
		mapper.insertBoardFile(cbFile);
	}

	@Override
	public void replyBoard(CodeBoard cb) {
		mapper.updateGroupOrder(cb);
		mapper.replyBoard(cb);
		
	}

	@Override
	public void updateGroupNo(int no) {
		mapper.updateGroupNo(no);
		
	}

	@Override
	public List<CodeBoard> boardListInfo(CodeSearch cs) {
		List<CodeBoard> list = mapper.selectBoard(cs);
		System.out.println("lsssssssssssssss"+list.size());
		
		return list;
	}

	@Override
	public int likeBoard(CodeBoardLike cbl) {		
//		mapper.selectCodeLike(cbl);
		System.out.println("impl: " + cbl.getId());
		System.out.println("impl : " + cbl.getNo());
		System.out.println("impl : " + mapper.selectCodeLike(cbl).size());
		if(mapper.selectCodeLike(cbl).size() != 0) { // 추천 안됨
			return 0;
		}else{
			mapper.insertCodeLike(cbl);
			mapper.updateBoardLikeCnt(cbl.getNo());			
			return mapper.selectBoardByNo(cbl.getNo()).getLikeCnt();
		}
	}

}
