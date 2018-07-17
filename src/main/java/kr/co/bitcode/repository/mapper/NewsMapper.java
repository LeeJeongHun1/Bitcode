package kr.co.bitcode.repository.mapper;

import kr.co.bitcode.repository.domain.Article;

public interface NewsMapper {

	// 기사 크롤링후 DB 저장
	public void insertNews(Article article);

	
}
