package com.rar.khbook.member.model.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSession session ,Member m);
	
	Member selectOneMember(SqlSession session,Map param);
	
	Member searchId1(SqlSession session,Member m);
	
	Member searchId2(SqlSession session,Member m);
}
