package com.rar.khbook.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember",m);
	}

	@Override
	public Member selectOneMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOneMember",param);
	}
	
	
}
