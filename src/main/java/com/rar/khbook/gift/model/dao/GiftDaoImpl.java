package com.rar.khbook.gift.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rar.khbook.member.model.vo.Member;

@Repository
public class GiftDaoImpl implements GiftDao {

	@Override
	public Member searchMember(String memberId, SqlSession session) {	
		return session.selectOne("member.selectOneMember", memberId);
	}

}
