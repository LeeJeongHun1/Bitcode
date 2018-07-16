package kr.co.bitcode.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.mapper.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	// 총 Q&A 갯수
	public int selectQnAAllCnt() {
		return mapper.selectQnAAllCnt();
	}
	// 총 Q&A에 대한 답글 갯수
	public int selectQnAAllAnswerCnt() {
		return mapper.selectQnAAllAnswerCnt();
	}

}
