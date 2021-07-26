package com.rar.khbook.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectMemberCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public int memberDelete(SqlSession session, String memberId) {
		// TODO Auto-generated method stub
		return session.delete("member.memberDelete",memberId);
	}

	@Override
	public int memberUpdate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.memberUpdate",param);
	}

	@Override
	public List<Member> memberHowT(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		System.out.println(param);
		return session.selectList("member.memberHowT",param);
	}
	
	
	
	
	
	

	
	
}
