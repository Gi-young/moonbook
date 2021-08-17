package com.rar.khbook.gift.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.gift.model.dao.GiftDao;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.GiftOrder;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

@Service
public class GiftServiceImpl implements GiftService {


	@Autowired
	private GiftDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Member searchMember(String memberId) {
		Member m = dao.searchMember(memberId, session);
		return m;
	}

	@Override
	public List<Ngift> giftAll() {
		List<Ngift> list = dao.giftAll(session);
		return list;
	}

	@Override
	public int insertGift(Map param) {
		int result = dao.insertGift(session, param);
		return result;
	}
	
	@Override
	public Ngift giftOne(int giftNo) {
		Ngift g = dao.giftOne(session, giftNo);
		return g;
	}

	@Override
	public List<GiftBoard>  selectReview(Map param) {
		// TODO Auto-generated method stub
		List<GiftBoard>  gb = dao.selectReview(session, param);
		return gb;
	}
	
	@Override
	public int reviewWrite(HashMap map) {
		// TODO Auto-generated method stub
		int result = dao.reviewWrite(session,map);
		return result;
	}

	@Override
	public int selectReviewAll(int giftNo) {
		// TODO Auto-generated method stub
		int totalData = dao.selectReviewAll(session, giftNo);
		return totalData;
	}
		
	
	@Override
	public int insertShopingList(Map param) {
		
		System.out.println(param.get("memberId"));
		System.out.println(param.get("giftNo"));
		System.out.println(param.get("quan"));
		Member m = dao.selectShopingMember(session, param);
		System.out.println("디비에서 뽑아 온 멤버 : "+m);
		try {
				GiftOrder go = new GiftOrder(); // 기프트 장바구니
				go.setMemberId(String.valueOf(param.get("memberId")));
				go.setGiftNo(Integer.parseInt(param.get("giftNo").toString()));
				go.setShopingListCount(Integer.parseInt(param.get("quan").toString()));
				//go = dao.selectShopingList(session, param);
				System.out.println("지오 멤버 아이디 : "+go.getMemberId());
			    System.out.println("그냥 멤버 아이디 : "+m.getMemberId());
			if(go.getMemberId().equals(m.getMemberId())) {
				int result = dao.insertShopingGift(session,go);
				System.out.println("서비스에서 넘어온 insertShopingGift result : "+result);
			}else {			
				return -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	@Override
	public List<Coupon> selectCoupon(String memberId) {
		
		List<Coupon> c = dao.selectCoupon(session, memberId);
		
		return c;
	}
	
//	접속한 회원의 쿠폰 종류
	@Override
	public List<Couponlist> selectCouponlist(List<Coupon> c) {
		
		List<Couponlist> cpList= new ArrayList();
		for(Coupon cp : c) {
			//System.out.println("여기서 다 뽑는 중 : "+cp);			
			Couponlist cl = dao.selectCouponlist(session, cp.getCouponCouponlistNo());	
			cpList.add(cl);
		}
		System.out.println("씨피 리스트 : "+cpList);
		
		return cpList;
	}

	
	@Override
	public int writePurchaseLog(Map param) {
		
		int result = dao.writePurchaseLog(session, param);
		
		return result;
	}
	
	@Override 
	public int writeOrderT(Map param) {
		int result = dao.writeOrderT(session, param);
		return result;
	}
	
	
	@Override
	public int updateSalesVolume(Map param) {
	
//		판매량에 구매수량만큼 추가
		int result1 = dao.updateSalesVolume(session, param);
		System.out.println(result1);
		if(result1>0) {
//			상품재고 - 구매수량
			int result2 = dao.updateStock(session, param);
//			멤버 테이블 구매금액 추가
			int result3 = dao.updateMemberPP(session, param);
//			멤버 적립포인트 추가
			int result4 = dao.updateMemberPoint(session, param);
//			구매내역에 추가
			int result5 = dao.updatePurchaseList(session, param);
//			쿠폰은 choiceCoupon 에서 처리
			return 1;
		}else {
			return 0;
		}

	}
	
	
}
