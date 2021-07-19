package com.rar.khbook.member.model.service;


import java.util.List;
import java.util.Map;

import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member selectOneMember(Map param);
	
	Member searchId1(Member m); //이름 ,전화번호 -> 아이디 찾기
	
	Member searchId2(Member m); //이름 ,이메일 ->아이디 찾기
	
	Member searchId3(Member m); //아이디 ,이름 ,전화번호 -> 아이디 조회 
	
	Member searchId4(Member m); //아이디 ,이름 ,이메일 -> 아이디 조회 
	
	int updateMemberPw(Member m);
	
	List<Coupon> getCoupon(Member m);
}