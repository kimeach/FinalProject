package com.myspring.pro.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro.member.vo.MemberVO;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList =null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		return sqlSession.insert("mapper.member.insertMember", memberVO);
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		return sqlSession.delete("mapper.member.deleteMember", id);
	}

	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.loginById", memberVO);
	}

	@Override
	public MemberVO getMemberById(String id) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectById", id);
	}

	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("mapper.member.updateMember", memberVO);
	}

}
