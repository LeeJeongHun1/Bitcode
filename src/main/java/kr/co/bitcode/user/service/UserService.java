package kr.co.bitcode.user.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.User;

public interface UserService {
	//유저 기본정보 수정
	void updateUser(User user) throws Exception; 
	//비번수정
	void updateUserPass (User user) throws Exception;
	
	// ID 와 Email 매칭 유저 찾기
	User selectbyIdEmail(User user) throws Exception;
	
	//유저 질문 목록
	List<Qna> selectmyQuestion(String id) throws Exception;

	//출석체크
	void insertAttendance(Attendance attend) throws Exception;
	//출석체크
	List<Attendance> selectAttendance(String id) throws Exception;

}
