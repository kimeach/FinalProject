package com.Project.myProject.CompanyMember.DAO;

import java.util.List;

import com.Project.myProject.CompanyMember.VO.CompanyMemberVO;

public interface CompanyMemberDAO {
public List<String> selectMember(String select,String keyword) throws Exception;
public List<String> selectChooseMember(int pg) throws Exception;
public List<String> SearchMember(int pg,String searchSelect,String keyword) throws Exception;
public List<String> selectCount(int authNum,String itemSelect)throws Exception;

}
