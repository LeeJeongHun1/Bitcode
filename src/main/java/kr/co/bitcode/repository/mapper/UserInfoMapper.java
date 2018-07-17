package kr.co.bitcode.repository.mapper;



import java.util.List;

import kr.co.bitcode.repository.domain.Qna;

public interface UserInfoMapper {
	//유저 질문 목록
	public List<Qna> selectmyQuestion(String id) throws Exception;
}
