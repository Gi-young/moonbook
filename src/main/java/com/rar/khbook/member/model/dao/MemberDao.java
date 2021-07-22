package com.rar.khbook.member.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;

public interface MemberDao {

	int insertMember(SqlSession session ,Member m);
	
	Member selectOneMember(SqlSession session,Map param);
	
	Member searchId1(SqlSession session,Member m);
	
	Member searchId2(SqlSession session,Member m);
	
	Member searchId3(SqlSession session,Member m);
	
	Member searchId4(SqlSession session,Member m);
	
	int updateMemberPw(SqlSession session,Member m);
	
//	쿠폰 가져오기
	List<Coupon> getCoupon(SqlSession session, Member m);
	
//	회원의 회원등급 가져오기
	Membergrade getMembergrade(SqlSession session, Member m);
	
//	전체 회원 등급 가져오기
	List<Membergrade> memberGrade(SqlSession session);
}
