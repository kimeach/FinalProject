package com.Project.myProject.CompanyMember.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Project.myProject.CompanyMember.DAO.CompanyMemberDAO;
import com.Project.myProject.CompanyMember.VO.CompanyMemberVO;

@Service("CompanyMemberService")
public class CompanyMemberServiceImpl implements CompanyMemberService{
@Autowired
private CompanyMemberDAO CompanyMemberDAO;	
	
	
	@Override
public List<CompanyMemberVO> SelectMember() throws Exception {
	// TODO Auto-generated method stub
	return CompanyMemberDAO.selectMember();
}
}
