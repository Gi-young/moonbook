package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.annotation.Order;

import com.rar.khbook.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	
	int memberDelete(String memberId);
	
	int memberUpdate(Map param);

	List<Member> memberHowT(Map param);
	
	List<Member> memberHowT2(Map param);
	
	List<Order> selectOrderList(int cPage,int numPerpage);
	
	int insertProduct1(Map param);
	
	int updateProduct1(Map param);
}
