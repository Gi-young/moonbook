package com.rar.khbook.member.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.order.model.vo.Payment;

public interface MemberService {

	int insertMember(Member m);

	Member selectOneMember(Map param);

	Member searchId1(Member m); // 이름 ,전화번호 -> 아이디 찾기

	Member searchId2(Member m); // 이름 ,이메일 ->아이디 찾기

	Member searchId3(Member m); // 아이디 ,이름 ,전화번호 -> 아이디 조회

	Member searchId4(Member m); // 아이디 ,이름 ,이메일 -> 아이디 조회

	int updateMemberPw(Member m);

//	회원의 쿠폰 가져옴
	List<Coupon> getCoupon(Member m);

//	회원의 회원등급 가져옴
	Membergrade getMembergrade(Member m);

//	전체 회원등급 가져옴
	List<Membergrade> memberGrade();

//	전체 쿠폰리스트 가져옴
	List<Couponlist> couponlist();

//	회원 정보 수정
	int updateMemberEnd(Member m);

	// 방문횟수 +1 증가
	int updateMemberVisit(Map param);

	// 최근 로그인 날짜 변경
	int updateMemberToday(Map param);

//	회원 탈퇴
	int deleteMember(Member m);

//	회원 종합 결제내역 조회
	List<Payment> getPayment(Member m);

//	회원 달별 결제 요금 조회
	List<Integer> getPaidAmount(Map param);

//	개인 회원 이북 결제내역 총합
	int ebookPurchaseCount(Map param);

//	개인 회원 도서 결제 내역 총합
	int bookPurchaseCount(Map<String, String> param);

	// 개인 회원 기프트 결제 내역 총합
	int giftPurchaseCount(Map param);

//	개인 회원 이북 결제 내역 조회
	List<Order> ebookPurchaseList(Map param, int cPage, int numPerpage);

//	개인 회원 도서 결제 내역 조회
	List<Order> bookPurchaseList(Map<String, String> param, int cPage, int numPerpage);
	
//	개인 회원 기프트 결제 내역 조회
	List<Order> giftPurchaseList(Map param, int cPage, int numPerpage);
	
//  회원가입 성공시 장바구니 만들기
	int createShopingList(Member m);
}