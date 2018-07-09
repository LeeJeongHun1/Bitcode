package kr.co.bitcode.login.service;

import kr.co.bitcode.repository.domain.User;

public interface LoginService {
	public User selectUserById (String id) throws Exception;
	public void insertMemberInfo(User user) throws Exception;
	
	public User selectUserByIdPass (User user) throws Exception;
	
}
