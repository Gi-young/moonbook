package com.rar.khbook.member.model.service;


import java.util.Map;

import org.springframework.ui.Model;

import com.rar.khbook.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member selectOneMember(Map param);
	
	Member searchId1(Member m);
	
	Member searchId2(Member m);
}