package com.rar.khbook.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSession session,int cPage,int numPerpage);
	
	int selectMemberCount(SqlSession session);
	
	int memberDelete(SqlSession session,String memberId);
	
	int memberUpdate(SqlSession session,Map param);
	
	List<Member> memberHowT(SqlSession session,Map param);
	
}
