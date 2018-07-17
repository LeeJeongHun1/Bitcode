package kr.co.bitcode.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.mapper.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	/** 총 Q&A 문의/답변 갯수 */
	public List<Map> answerCnt() {
		List<Map> result = mapper.selectAllCnt();
		return result;
	}

}
