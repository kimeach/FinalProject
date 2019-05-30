package com.Project.myProject.Item.DAO;

import java.util.List;

import com.Project.myProject.Item.VO.primaryVO;

public interface ItemDAO {
public int ItemInsert(primaryVO vo) throws Exception;
public int ItemDelete(String id) throws Exception;
public int ItemUpdate(String id) throws Exception;
public List<primaryVO> ItemSelect() throws Exception;
public List<primaryVO> SearchAgency(String id) throws Exception;

}
