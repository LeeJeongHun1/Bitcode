package kr.co.bitcode.repository.mapper;

import java.util.List;

import kr.co.bitcode.repository.domain.Article;

public interface NewsMapper {

	// 기사 크롤링후 DB 저장
	public void insertNews(Article article);
	// 기사 리스트 출력
	public List<Article> selectITNews();
	// 기사 번호로 select 출력하기
	public Article selectITNewsByNo(int articleNo);
}
