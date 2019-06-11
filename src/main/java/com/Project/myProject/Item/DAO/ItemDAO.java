package com.Project.myProject.Item.DAO;

import java.util.List;
import java.util.Map;

import com.Project.myProject.Item.VO.primaryVO;

public interface ItemDAO {
public int ItemInsert(primaryVO vo) throws Exception;
public int ItemDelete(Map<String,Object> delMap) throws Exception;
public int ItemUpdate(String id) throws Exception;
public List<primaryVO> ItemSelect(String authNum) throws Exception;
public List<primaryVO> ItemAllSelect() throws Exception;
public List<primaryVO> ItemViewSelect(Map<String,Object> lists) throws Exception;
public List<String> getSelectSearch() throws Exception;
}
