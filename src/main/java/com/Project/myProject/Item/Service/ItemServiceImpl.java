package com.Project.myProject.Item.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project.myProject.Item.DAO.ItemDAO;
import com.Project.myProject.Item.VO.primaryVO;

@Service("ItemService")
public class ItemServiceImpl implements ItemService{
@Autowired
private ItemDAO ItemDAO;

@Override
public int ItemAdd(primaryVO vo) throws Exception {
	// TODO Auto-generated method stub
	return ItemDAO.ItemInsert(vo);
}

@Override
public int ItemDelete(String id) throws Exception {
	// TODO Auto-generated method stub
	return ItemDAO.ItemDelete(id);
}

@Override
public int ItemUpdate(String id) throws Exception {
	// TODO Auto-generated method stub
	return ItemDAO.ItemUpdate(id);
}

@Override
public List<primaryVO> ItemSelect() throws Exception {
	return ItemDAO.ItemSelect();
}
	
	



}
