package com.Project.myProject.CompanyMember.DAO;

import java.util.List;

import com.Project.myProject.CompanyMember.VO.CompanyMemberVO;

public interface CompanyMemberDAO {
public List<CompanyMemberVO> selectMember() throws Exception;
}
