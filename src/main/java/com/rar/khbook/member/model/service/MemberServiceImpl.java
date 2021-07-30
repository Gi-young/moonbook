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
			if (canuse.equals("Y")) {
				dao.insertCoupon(session, m);
			}
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
}
