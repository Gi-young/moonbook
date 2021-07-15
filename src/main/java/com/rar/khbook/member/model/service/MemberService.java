package com.rar.khbook.member.model.service;


import java.util.Map;

import com.rar.khbook.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member selectOneMember(Map param);
}