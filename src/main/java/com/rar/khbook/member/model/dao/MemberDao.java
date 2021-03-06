package com.rar.khbook.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.coupon.model.vo.OrderWithCoupon;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.order.model.vo.Payment;

public interface MemberDao {

	int insertMember(SqlSession session, Member m);

	Member selectOneMember(SqlSession session, Map param);

	Member searchId1(SqlSession session, Member m);

	Member searchId2(SqlSession session, Member m);

	Member searchId3(SqlSession session, Member m);

	Member searchId4(SqlSession session, Member m);

	int updateMemberPw(SqlSession session, Member m);

//	회원의 쿠폰 가져오기
	List<OrderWithCoupon> getCoupon(SqlSession session, Member m);

//	회원의 회원등급 가져오기
	Membergrade getMembergrade(SqlSession session, Member m);

//	전체 회원 등급 가져오기
	List<Membergrade> memberGrade(SqlSession session);

//	전체 쿠폰리스트 가져오기
	List<Couponlist> couponlist(SqlSession session);

//	사용한 쿠폰 개수 가져옴
	int couponCount(SqlSession session, Member m);
	
//	사용한 쿠폰 가져오기
	List<OrderWithCoupon> getUsedCoupon(SqlSession session, int cPage, int numPerpage, Member m);
	
//	회원가입 감사 쿠폰 발급
	int insertCoupon(SqlSession session, Member m);

//	회원 정보 수정
	int updateMemberEnd(SqlSession session, Member m);

	// 방문횟수 +1 증가
	int updateMemberVisit(SqlSession session, Map param);

	// 최근 로그인 날짜 변경
	int updateMemberToday(SqlSession session, Map param);

//	회원 탈퇴
	int deleteMember(SqlSession session, Member m);

//	회원의 결제 내역 조회
	List<Payment> getPayment(SqlSession session, Member m);

//	회원의 월별 결제 내역 조회
	List<Integer> getPaidAmount(SqlSession session, Map param);

//	개인 회원 이북 결제 내역 총합
	int ebookPurchaseCount(SqlSession session, Map<String, String> param);

//	개인 회원 도서 결제 내역 총합
	int bookPurchaseCount(SqlSession session, Map<String, String> param);
	
//	개인 회원 기프트 결제 내역 총합
	int giftPurchaseCount(SqlSession session, Map<String, String> param);

//	개인 회원 이북 결제 내역 조회
	List<Order> ebookPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage);

//	개인 회원 도서 결제 내역 조회
	List<Order> bookPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage);
	
//	개인 회원 기프트 결제 내역 조회
	List<Order> giftPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage);

// 회원 포인트 적립
	int updateMemberPoint(SqlSession session, Map param);


	// 회원가입 후 장바구니 
	int createShopingList(SqlSession session, Member m);
	
//	주문 상세보기
	Order getOneOrder(SqlSession session, String orderNo);

}
