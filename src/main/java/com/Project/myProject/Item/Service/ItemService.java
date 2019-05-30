package com.Project.myProject.Item.Service;

import java.util.List;


import com.Project.myProject.Item.VO.primaryVO;

public interface ItemService {
	public int ItemAdd(primaryVO vo) throws Exception;
	public int ItemDelete(String id) throws Exception;
	public int ItemUpdate(String id) throws Exception;
	public List<primaryVO> ItemSelect() throws Exception;
}
