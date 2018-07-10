package kr.co.bitcode.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.UserMapper;


@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public User selectUserById(String id) throws Exception {
		return userMapper.selectUserById(id);
	}
	@Override
	public void insertMemberInfo(User user) throws Exception {
		userMapper.insertUser(user);
	}
	@Override
	public User selectUserByNameEmail(User user) throws Exception {
		return userMapper.selectUserByNameEmail(user);
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public User selectUserByIdPass(User user) throws Exception {
		
		return userMapper.selectUserByIdPass(user);
	}
}
