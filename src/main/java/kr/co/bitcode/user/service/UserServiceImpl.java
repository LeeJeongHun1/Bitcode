package kr.co.bitcode.user.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Attendance;
import kr.co.bitcode.repository.domain.Qna;
import kr.co.bitcode.repository.domain.StsfcCode;
import kr.co.bitcode.repository.domain.User;
import kr.co.bitcode.repository.mapper.UserInfoMapper;
import kr.co.bitcode.repository.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}

	@Override
	public void updateUserPass(User user) throws Exception {
		userMapper.updateUserPass(user);
	}

	
	@Override
	public User selectbyIdEmail(User user) throws Exception {
		return userMapper.selectbyIdEmail(user);
	}
//출석
	@Override
	public void insertAttendance(Attendance attend) throws Exception {
		 userInfoMapper.insertAttendance(attend);
		
	}

	@Override
	public List<Attendance> selectAttendance(String id) throws Exception {
		return userInfoMapper.selectAttendance(id);
	}

	@Override
	public List<StsfcCode> selectmyQuestion(String id) throws Exception {
		
		return userInfoMapper.selectmyQuestion(id);
	}

	@Override
	public void updateNick(User user) throws Exception {
		userMapper.updateNick(user);
	}

	@Override
	public void updateEmail(User user) throws Exception {
		userMapper.updateEmail(user);
		
	}

	@Override
	public Attendance selectAttenByIdDate(Attendance attendance) throws Exception {
		
		return userInfoMapper.selectAttenByIdDate(attendance);
	}
//출석시 포인트 지급
	@Override
	public void updateUserPoint(String id) throws Exception {
		userInfoMapper.updateUserPoint(id);
		
	}


	


	
}
