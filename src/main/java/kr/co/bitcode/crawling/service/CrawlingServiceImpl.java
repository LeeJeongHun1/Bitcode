package kr.co.bitcode.crawling.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.mapper.NewsMapper;

@Service("crawlingService")
public class CrawlingServiceImpl implements CrawlingService{

	@Autowired
	private NewsMapper mapper;
	@Override
	public void insertArticle(List<Article> a) {
		for (Article article : a) {
			mapper.insertNews(article);
		}
	}
}
