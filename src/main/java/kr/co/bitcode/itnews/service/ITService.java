package kr.co.bitcode.itnews.service;

import java.util.List;

import kr.co.bitcode.repository.domain.Article;
import kr.co.bitcode.repository.domain.NewsComment;

public interface ITService {
	// 기사 리스트 출력
	List<Article> selectITNews();
	// 기사 번호로 select 출력하기
	Article selectITNewsByNo(int articleNo);
	//댓글 출력
	List<NewsComment> retrieveListComment(int articleNo);
	//댓글 입력
	void insertArticleComment(NewsComment newsComment);
	//댓글 수정
	void updateArticleComment(NewsComment newsComment);
	//댓글 삭제
	void deleteArticleComment(int commentNo);
	
}
