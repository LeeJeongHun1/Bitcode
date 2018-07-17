package kr.co.bitcode.crawling.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Article;

public interface CrawlingService {
	public void insertArticle(List<Article> a);
	// 기사 리스트 출력
	public List<Article> selectITNews();
}
