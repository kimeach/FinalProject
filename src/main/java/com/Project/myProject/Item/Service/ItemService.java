package com.Project.myProject.Item.Service;

import java.util.List;
import java.util.Map;

import com.Project.myProject.Item.VO.primaryVO;

public interface ItemService {
	public int ItemAdd(primaryVO vo) throws Exception;
	public int ItemDelete(String authNum,String autoNum) throws Exception;
	public int ItemUpdate(String id) throws Exception;
	public List<primaryVO> ItemSelect(String authNum) throws Exception;
	public List<primaryVO> ItemViewSelect(String authNum,String autoNum) throws Exception;

}
