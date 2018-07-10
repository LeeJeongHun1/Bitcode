package kr.co.bitcode.repository.mapper;

import kr.co.bitcode.repository.domain.User;

public interface UserMapper {
	public User selectUserById (String id) throws Exception;
	
	public void insertUser(User user) throws Exception;
	
	//ID 찾기
	public User selectUserByNameEmail(User user) throws Exception;
	//유저정보 수정
	public void updateUser(User user) throws Exception;
	
	
	
	public User selectUserByIdPass (User user) throws Exception;
	
	
}
