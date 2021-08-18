package com.rar.khbook.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.member.model.dao.MemberDao;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.order.model.vo.Payment;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSession session;

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		int result = dao.insertMember(session, m);
//		회원가입시 회원가입감사쿠폰 발급
//		쿠폰리스트에서 회원가입시 발급해주는 쿠폰의 이용가능여부를 가져옴
		if (result > 0) {
			List<Couponlist> cl = dao.couponlist(session);
			String canuse = "";
			for (Couponlist c : cl) {
				if (c.getCouponlistNo() == 1) {
					canuse = c.getCouponlistForuse();
				}
			}
//		이용가능 여부 체크 후 쿠폰 발급
			/*
			 * if (canuse.equals("Y")) { dao.insertCoupon(session, m); }
			 */
		}
		return result;
	}

	@Override
	public Member selectOneMember(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(session, param);
	}

	@Override
	public Member searchId1(Member m) {
		// TODO Auto-generated method stub
		return dao.searchId1(session, m);
	}

	@Override
	public Member searchId2(Member m) {
		// TODO Auto-generated method stub
		return dao.searchId2(session, m);
	}

	@Override
	public Member searchId3(Member m) {
		// TODO Auto-generated method stub
		return dao.searchId3(session, m);
	}

	@Override
	public Member searchId4(Member m) {
		// TODO Auto-generated method stub
		return dao.searchId4(session, m);
	}

	@Override
	public int updateMemberPw(Member m) {
		// TODO Auto-generated method stub
		return dao.updateMemberPw(session, m);
	}

//	회원의 쿠폰 가져오기
	@Override
	public List<Coupon> getCoupon(Member m) {
		// TODO Auto-generated method stub
		return dao.getCoupon(session, m);
	}

//	회원의 회원등급 가져오기
	@Override
	public Membergrade getMembergrade(Member m) {
		// TODO Auto-generated method stub
		return dao.getMembergrade(session, m);
	}

//	전체 회원 등급 가져오기
	@Override
	public List<Membergrade> memberGrade() {
		// TODO Auto-generated method stub
		return dao.memberGrade(session);
	}

	// 방문횟수 +1증가
	@Override
	public int updateMemberVisit(Map param) {
		// TODO Auto-generated method stub
		return dao.updateMemberVisit(session, param);
	}

	// 최근 로그인 날짜 변경
	@Override
	public int updateMemberToday(Map param) {
		// TODO Auto-generated method stub
		return dao.updateMemberToday(session, param);
	}

//	전체 쿠폰리스트 가져오기
	@Override
	public List<Couponlist> couponlist() {
		// TODO Auto-generated method stub
		return dao.couponlist(session);
	}

//	회원 정보 수정
	@Override
	public int updateMemberEnd(Member m) {
		// TODO Auto-generated method stub
		return dao.updateMemberEnd(session, m);
	}

//	회원 탈퇴
	@Override
	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return dao.deleteMember(session, m);
	}
	
//	회원의 결제 내역 조회
	@Override
	public List<Payment> getPayment(Member m) {
		// TODO Auto-generated method stub
		return dao.getPayment(session, m);
	}
	
//	회원 월별 결제 요금 조회 
	@Override
	public List<Integer> getPaidAmount(Map param) {
		// TODO Auto-generated method stub
		return dao.getPaidAmount(session, param);
	}
	
//	개인 회원 이북 결제 내역 총합
	@Override
	public int ebookPurchaseCount(Map param) {
		// TODO Auto-generated method stub
		return dao.ebookPurchaseCount(session, param);
	}
	
//	개인 회원 도서 결제 내역 총합
	@Override
	public int bookPurchaseCount(Map<String, String> param) {
		// TODO Auto-generated method stub
		return dao.bookPurchaseCount(session, param);
	}
	
//	개인 회원 기프트 결제 내역 총합
	@Override
	public int giftPurchaseCount(Map param) {
		// TODO Auto-generated method stub
		return dao.giftPurchaseCount(session, param);
	}
	
//	개인 회원 이북 결제 내역 조회
	@Override
	public List<Order> ebookPurchaseList(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.ebookPurchaseList(session, param, cPage, numPerpage);
	}
	
//	개인 회원 도서 결제 내역 조회
	@Override
	public List<Order> bookPurchaseList(Map<String, String> param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.bookPurchaseList(session, param, cPage, numPerpage);
	}
	
//	개인 회원 기프트 결제 내역 조회
	@Override
	public List<Order> giftPurchaseList(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.giftPurchaseList(session, param, cPage, numPerpage);

	// 회원가입 후 장바구니
	@Override 
	public int createShopingList(Member m) {
		return dao.createShopingList(session, m);
	}
}
