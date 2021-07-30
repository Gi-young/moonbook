package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.core.annotation.Order;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

public interface AdminService {
	
	List<Member> selectMemberList(int cPage,int numPerpage);
	int selectMemberCount();
	
	int memberDelete(String memberId);
	
	int memberUpdate(Map param);

	List<Member> memberHowT(Map param);
	
	List<Member> memberHowT2(Map param);
	
	List<Order> selectOrderList(int cPage,int numPerpage);
	
	int insertProduct1(Map param); //등록
	 
	int updateProduct1(Map param); //입고
	
	EbookDatabind searchBringPrice(int bindNo); //가격 가져오는 로직 book
	
	EbookDatabind checkStock1(int bindNo);
	
	int outputProduct1(Map param); //재고에서 -출고 개수
	
	int updateSalesVolume1(Map param); //판매량 +출고 개수
}
