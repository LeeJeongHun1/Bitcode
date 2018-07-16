package kr.co.bitcode.admin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.mapper.AdminMapper;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	// 답변율 갯수
	public Map<String, Integer> answerCnt() {
		Map<String, Integer> result = new HashMap<>();
		
		// 총 Q&A 갯수
		result.put("allCnt", mapper.selectQnAAllCnt());
		// 총 Q&A에 대한 답글 갯수
		result.put("ansCnt", mapper.selectQnAAllAnswerCnt());
		// C 문의글 갯수
		result.put("cCnt", mapper.selectQnACCnt());
		// Java 문의글 갯수
		result.put("javaCnt", mapper.selectQnAJavaCnt());
		// JavaScript 문의글 갯수
		result.put("javascriptCnt", mapper.selectQnAJavaScriptCnt());
		// Python 문의글 갯수
		result.put("pythonCnt", mapper.selectQnAPythonCnt());
		// ASP 문의글 갯수
		result.put("aspCnt", mapper.selectQnAASPCnt());
		// PHP 문의글 갯수
		result.put("phpCnt", mapper.selectQnAPHPCnt());
		
		return result;
	}

}
