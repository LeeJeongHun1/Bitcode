package kr.co.bitcode.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMApper;
	
	@Override
	public void updateUser(User user) throws Exception {
		userMApper.updateUser(user);
	}

}
