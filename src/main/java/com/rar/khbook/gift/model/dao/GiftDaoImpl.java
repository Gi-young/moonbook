package com.rar.khbook.gift.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.GiftOrder;
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
	public List<GiftBoard> selectReview(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerPage = Integer.parseInt((String)param.get("numPerPage"));
		
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return session.selectList("gift.selectReview", param, rb);
	}

	@Override
	public int reviewWrite(SqlSession session, HashMap map) {
		return session.insert("gift.insertReview", map);
	}

	@Override
	public int selectReviewAll(SqlSession session, int giftNo) {
		// TODO Auto-generated method stub
		return session.selectOne("gift.selectReviewAll", giftNo);
	}
	
	@Override
	public Member selectShopingMember(SqlSession session, Map param) {
		return session.selectOne("member.selectOneMember",param);
	}	
	
	@Override
	public GiftOrder selectShopingList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("gift.selectShopingList",param);
	}
	
	@Override 
	public int insertShopingGift(SqlSession session, GiftOrder go) {
		return session.insert("gift.insertShopingGift",go);
	}
	
//	접속한 회원에게 쿠폰이 있는지 확인
	@Override
	public List<Coupon> selectCoupon(SqlSession session, String memberId) {
		return session.selectList("gift.selectCoupon", memberId);
	}
	
	
//	접속한 회원의 쿠폰 종류
	@Override
	public Couponlist selectCouponlist(SqlSession session, int couponCouponListNo) {	
		return session.selectOne("gift.selectCouponlist", couponCouponListNo);
	}
}
