package kr.co.bitcode.user.service;

import kr.co.bitcode.repository.domain.User;

public interface UserService {
	//유저 기본정보 수정
	public void updateUser(User user) throws Exception; 
	//비번수정
	public void updateUserPass (User user) throws Exception;
}