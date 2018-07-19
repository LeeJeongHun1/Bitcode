package kr.co.bitcode.repository.mapper;



import java.util.List;

import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;

public interface UserInfoMapper {
	//유저 질문 목록
	public List<Qna> selectmyQuestion(String id) throws Exception;
	
	//출석체크
	public void insertAttendance(Attendance attend) throws Exception;
	//출석체크
	public List<Attendance> selectAttendance(String id) throws Exception;
	
}
