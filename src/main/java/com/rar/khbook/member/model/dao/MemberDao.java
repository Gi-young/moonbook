package com.rar.khbook.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;

public interface MemberDao {

	int insertMember(SqlSession session, Member m);

	Member selectOneMember(SqlSession session, Map param);

	Member searchId1(SqlSession session, Member m);

	Member searchId2(SqlSession session, Member m);

	Member searchId3(SqlSession session, Member m);

	Member searchId4(SqlSession session, Member m);

	int updateMemberPw(SqlSession session, Member m);

//	회원의 쿠폰 가져오기
	List<Coupon> getCoupon(SqlSession session, Member m);

//	회원의 회원등급 가져오기
	Membergrade getMembergrade(SqlSession session, Member m);

//	전체 회원 등급 가져오기
	List<Membergrade> memberGrade(SqlSession session);

//	전체 쿠폰리스트 가져오기
	List<Couponlist> couponlist(SqlSession session);

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

//	개인 회원 이북 결제 내역 총합
	int ebookPurchaseCount(SqlSession session, Map<String, String> param);

//	개인 회원 이북 결제 내역 조회
	List<Order> ebookPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage);
}
