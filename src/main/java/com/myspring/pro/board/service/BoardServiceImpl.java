package com.myspring.pro.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.pro.board.dao.BoardDAO;
import com.myspring.pro.board.vo.ArticleVO;
import com.myspring.pro.common.paging.Criteria;




@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)//transaction처리
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<ArticleVO> listArticles() throws Exception {
		return boardDAO.selectAllArticlesList();
}
	 
	@Override
	public List<ArticleVO> listArticles(String keyword) throws Exception {
		return boardDAO.selectAllArticlesList(keyword);
	}
	
	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		return boardDAO.insertNewArticle(articleMap);
	}

	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {
		return boardDAO.selectArticle(articleNO);
	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);	
	}

	
	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return boardDAO.listCriteria(criteria);
	}

	@Override
	public int CountArticles(Criteria criteria) throws Exception {
		return boardDAO.CountArticles(criteria);
	}

	@Override
	public int addReply(Map articleMap) throws Exception {
		return boardDAO.insertReply(articleMap);
	}

}
