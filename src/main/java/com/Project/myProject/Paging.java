package com.Project.myProject;

import java.util.HashMap;
import java.util.Map;
public class Paging {
	
	public int TotalPage(int num){
	int page = 10;
	int pagiNation = (int)(Math.floor(num/page)+1); // 페이지네이션 갯수 나타내기
	return pagiNation;
	}
	public Map<String,Object> pagingMap(int pg,String keyword) {
	int page = 10;
	int minPage=0;
	int maxPage=0;
if(pg==1) {
	minPage = pg;
	maxPage = pg*page;
	}
else if(pg>1) {
	maxPage = pg*page;
	minPage = maxPage-(page-1);
	}
	Map<String, Object> KeywordMap = new HashMap<String, Object>();
	KeywordMap.put("keyword", keyword);
	KeywordMap.put("minPage", minPage);
	KeywordMap.put("maxPage", maxPage);
	return KeywordMap;
}
	
	
	public Map<String,Object> pagingMap(int pg) {
		int page = 10;
		int minPage=0;
		int maxPage=0;
	if(pg==1) {
		minPage = pg;
		maxPage = pg*page;
		}
	else if(pg>1) {
		maxPage = pg*page;
		minPage = maxPage-(page-1);
		}
	Map<String, Object> PageMap = new HashMap<String, Object>();
	PageMap.put("minPage", minPage);
	PageMap.put("maxPage", maxPage);
	return PageMap;
	}
	
	

}
