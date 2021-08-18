package com.rar.khbook.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.order.model.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember", m);
	}

	@Override
	public Member selectOneMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOneMember", param);
	}

	@Override
	public Member searchId1(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId1", m);
	}

	@Override
	public Member searchId2(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId2", m);
	}

	@Override
	public Member searchId3(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId3", m);
	}

	@Override
	public Member searchId4(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId4", m);
	}

	@Override
	public int updateMemberPw(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberPw", m);
	}

//	회원의 쿠폰 가져오기
	@Override
	public List<Coupon> getCoupon(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("member.getCoupon", m);
	}

//	회원의 회원등급 가져오기
	@Override
	public Membergrade getMembergrade(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.getMembergrade", m);
	}

//	전체 회원 등급 가져오기
	@Override
	public List<Membergrade> memberGrade(SqlSession session) {
		// TODO Auto-generated method stub

		return session.selectList("member.memberGrade");
	}

//	전체 쿠폰리스트 가져오기
	@Override
	public List<Couponlist> couponlist(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("member.couponlist");
	}

	@Override
	public int updateMemberVisit(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberVisit", param);
	}

	@Override
	public int updateMemberToday(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberToday", param);
	}

//	회원가입 감사 쿠폰 발급
	@Override
	public int insertCoupon(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		System.out.println("여기 아이디 들어가는데" + m.getMemberId());
		return session.insert("member.insertCoupon", m);
	}

//	회원정보수정
	@Override
	public int updateMemberEnd(SqlSession session, Member m) {
		// TODO Auto-generated method stub

		return session.update("member.updateMemberEnd", m);
	}

//	회원 탈퇴
	@Override
	public int deleteMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.delete("member.deleteMember", m);
	}

//	회원의 결제 내역 조회
	@Override
	public List<Payment> getPayment(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectList("order.getPayment", m);
	}
	
//	회원 월별 결제 요금 조회
	@Override
	public List<Integer> getPaidAmount(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		List<Integer> list = new ArrayList<Integer>();
		for(int i = 1; i < 5; i++) {
			param.put("start", param.get("start"+i));
			param.put("finish", param.get("finish"+i));
			list.add(session.selectOne("order.getPaidAmount", param));
		}
		return list;
	}
	
//	개인 회원 이북 결제 내역 총합
	@Override
	public int ebookPurchaseCount(SqlSession session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectOne("order.ebookPurchaseCount", param);
	}
	
//	개인 회원 도서 결제 내역 총합
	@Override
	public int bookPurchaseCount(SqlSession session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectOne("order.bookPurchaseCount", param);
	}
	
//	개인 회원 기프트 결제 내역 총합
	@Override
	public int giftPurchaseCount(SqlSession session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectOne("order.giftPurchaseCount", param);
	}
	
//	개인 회원 이북 결제 내역 조회
	@Override
	public List<Order> ebookPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		
		RowBounds row = new RowBounds((cPage-1)*numPerpage, numPerpage);
		
		return session.selectList("order.ebookPurchaseList", param, row);
	}
	
//	개인 회원 도서 결제 내역 조회
	@Override
	public List<Order> bookPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerpage, numPerpage);
		
		return session.selectList("order.bookPurchaseList", param, row);
	}
	
//	개인 회원 기프트 결제 내역 조회
	@Override
	public List<Order> giftPurchaseList(SqlSession session, Map<String, String> param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerpage, numPerpage);
		
		return session.selectList("order.giftPurchaseList", param, row);
	}
	
//	회원 포인트 적립
	@Override
	public int updateMemberPoint(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberPoint", param);
	}
}
