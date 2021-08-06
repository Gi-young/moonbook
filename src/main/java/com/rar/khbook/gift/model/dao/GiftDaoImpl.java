package com.rar.khbook.gift.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

@Repository
public class GiftDaoImpl implements GiftDao {

	@Override
	public Member searchMember(String memberId, SqlSession session) {	
		return session.selectOne("member.selectOneMember", memberId);
	}

	@Override
	public List<Ngift> giftAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("gift.selectGiftAll");
	}

	@Override
	public int insertGift(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int result = 0;
				try {
				  result = session.insert("gift.insertGift", param);
				}catch(Exception e) {
					e.printStackTrace();
				}
	   return result;
	}
	
	@Override
	public Ngift giftOne(SqlSession session,int giftNo) {
		return session.selectOne("gift.selectGiftOne", giftNo);
	}

	@Override
	public List<GiftBoard> selectReview(SqlSession session, int giftNo) {
		// TODO Auto-generated method stub
		return session.selectList("gift.selectReview", giftNo);
	}

	@Override
	public int reviewWrite(SqlSession session, int giftNo, Ngift n) {
		return session.insert("gift.insertReview", giftNo);
	}
}
