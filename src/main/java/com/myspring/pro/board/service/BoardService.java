package com.myspring.pro.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.pro.board.vo.ArticleVO;
import com.myspring.pro.common.paging.Criteria;


public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
	
	public List<ArticleVO> listArticles(String keyword) throws Exception;
	
	public int addNewArticle(Map articleMap) throws Exception;
	
	public ArticleVO viewArticle(int articleNO) throws Exception;

	public void removeArticle(int articleNO) throws Exception;

	public void modArticle(Map articleMap) throws Exception;
	
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	public int CountArticles(Criteria criteria) throws Exception;	
	
	public int addReply(Map articleMap) throws Exception;



	}
