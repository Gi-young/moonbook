package com.rar.khbook.member.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember",m);
	}

	@Override
	public Member selectOneMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOneMember",param);
	}

	@Override
	public Member searchId1(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId1",m);
	}

	@Override
	public Member searchId2(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId2",m);
	}

	@Override
	public Member searchId3(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId3", m);
	}

	@Override
	public Member searchId4(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchId4",m);
	}

	@Override
	public int updateMemberPw(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberPw",m);
	}
	
//	쿠폰 가져오기
	@Override
	public List<Coupon> getCoupon(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		log.debug(m.getMemberId());
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
	
	
	
}

