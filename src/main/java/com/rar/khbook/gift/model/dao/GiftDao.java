package com.rar.khbook.gift.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.GiftOrder;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;


public interface GiftDao {
	
	Member searchMember(String memberId, SqlSession session);
		
	List<Ngift> giftAll(SqlSession session);
		
	int insertGift(SqlSession session, Map param);
	
	Ngift giftOne(SqlSession session, int giftNo);
	
	List<GiftBoard>  selectReview(SqlSession session, Map param);
	
	int reviewWrite(SqlSession session, HashMap map);

	int selectReviewAll(SqlSession session, int giftNo);

	Member selectShopingMember(SqlSession session, Map param);
	
	GiftOrder selectShopingList(SqlSession session, Map param);
	
	int insertShopingGift(SqlSession session, GiftOrder go);	
	
//	접속한 회원에게 쿠폰이 있는지 확인
	List<Coupon> selectCoupon(SqlSession session, String memberId);
	
//	접속한 회원의 쿠폰 종류
	List<Couponlist> selectCouponlist(SqlSession session, List<Coupon> c);
}
