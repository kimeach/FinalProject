package com.myspring.pro.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.pro.member.vo.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 //회원정보
	 public MemberVO getMemberById(String id) throws Exception;
	 public int modMember(MemberVO memberVO) throws Exception;
	 
}
