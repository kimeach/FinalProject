package com.Project.myProject.CompanyMember.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Project.myProject.CompanyMember.VO.CompanyMemberVO;
@Repository("CompanyMemberDAO")
public class CompanyMemberDAOImpl implements CompanyMemberDAO{
@Autowired
private SqlSession spring;



@Override
public List<CompanyMemberVO> selectMember() throws Exception {
int al;
	return spring.selectList("mapper.CompanyMember.selectCompanyMember");

}
}
