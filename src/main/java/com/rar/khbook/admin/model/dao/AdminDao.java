package com.rar.khbook.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.core.annotation.Order;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

public interface AdminDao {

	List<Member> selectMemberList(SqlSession session,int cPage,int numPerpage);
	
	int selectMemberCount(SqlSession session);
	
	int memberDelete(SqlSession session,String memberId);
	
	int memberUpdate(SqlSession session,Map param);
	
	List<Member> memberHowT(SqlSession session,Map param);
	
	List<Member> memberHowT2(SqlSession session,Map param);
	
	List<Order> selectOrderList(SqlSession session,int cPage,int numPerpage);
	
	int insertProduct1(SqlSession session,Map param);
	
	int updateProduct1(SqlSession session,Map param);
	
	EbookDatabind searchBringPrice(SqlSession session,int bindNo); 
	
	int outputProduct1(SqlSession session,Map param);
	
	int updateSalesVolume1(SqlSession session,Map param);
	
}
