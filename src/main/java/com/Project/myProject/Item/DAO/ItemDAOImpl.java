package com.Project.myProject.Item.DAO;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.Project.myProject.Item.VO.primaryVO;
@Repository("ItemDAO")
public class ItemDAOImpl implements ItemDAO{
@Autowired
private SqlSession spring;

@Override
public int ItemInsert(primaryVO vo) throws Exception {
	
	return spring.insert("mapper.Item.insertItem", vo);
}

@Override
public int ItemDelete(String id) throws Exception {
	return spring.delete("mapper.Item.deleteItem", id);
}

@Override
public int ItemUpdate(String id) throws Exception {
	return spring.update("mapper.Item.updateItem", id);
}

@Override
public List<primaryVO> ItemSelect() throws Exception {
	return spring.selectList("mapper.Item.getViewItem");
}

@Override
public List<primaryVO> SearchAgency(String id) throws Exception {
	// TODO Auto-generated method stub
	return null;
}


}
