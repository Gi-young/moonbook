package com.rar.khbook.gift.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;


public interface GiftService {
	
//	
	Member searchMember(String memberId);
		
	List<Ngift> giftAll();
	
	int insertGift(Map param);
	
	Ngift giftOne(int giftNo);
	
	List<GiftBoard>  selectReview(Map param);
	
	int reviewWrite(HashMap map);

	int selectReviewAll(int giftNo);

	int insertShopingList(Map param);
	
//	접속한 회원에게 쿠폰이 있는지 확인
	Coupon selectCoupon(String memberId);

//	접속한 회원의 쿠폰 종류
	Couponlist selectCouponlist(Coupon c);
	
}



