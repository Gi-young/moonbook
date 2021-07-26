package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	
	int memberDelete(String memberId);

}
