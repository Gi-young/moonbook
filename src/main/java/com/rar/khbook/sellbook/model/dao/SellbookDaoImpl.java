package com.rar.khbook.sellbook.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

@Repository
public class SellbookDaoImpl implements SellbookDao {

	@Override
	public SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo) {
		return session.selectOne("SellbookDatabind.selectSellbookDatabind",bindNo);
	}

	@Override
	public Member checkMember(SqlSession session, String memberId) {
		System.out.println("DAO임");
		
		return session.selectOne("SellbookDatabind.checkMember",memberId);
	}

	@Override
	public SellbookDatabind selectBigView(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectBigView",bindNo);
	}

	@Override
	public SellbookDatabind selectBookPayment(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectBookPayment",bindNo);
	}
	
}
