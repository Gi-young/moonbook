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
	
	
	Member searchMember(String memberId);
		
	List<Ngift> giftAll();
	
	int insertGift(Map param);
	
	Ngift giftOne(int giftNo);
	
	List<GiftBoard>  selectReview(Map param);
	
	int reviewWrite(HashMap map);

	int selectReviewAll(int giftNo);

	int insertShopingList(Map param);
	
//	접속한 회원에게 쿠폰이 있는지 확인
	List<Coupon> selectCoupon(String memberId);

//	접속한 회원의 쿠폰 종류
	List<Couponlist> selectCouponlist(List<Coupon> c);

//  상품 구매 이후 처리해야 할 로직
	int updateSalesVolume(Map param);

//	결제 테이블에 추가
	int writePurchaseLog(Map param);

//	결제 테이블에 추가 하기 전,	 order_no 생성
	int writeOrderT(Map param);	
}



