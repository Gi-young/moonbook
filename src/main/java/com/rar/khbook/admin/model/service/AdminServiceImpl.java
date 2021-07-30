package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.rar.khbook.admin.model.dao.AdminDao;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,cPage,numPerpage);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount(session);
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(session,memberId);
	}

	@Override
	public int memberUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(session,param);
	}

	@Override
	public List<Member> memberHowT(Map param) {
		// TODO Auto-generated method stub
		return dao.memberHowT(session,param);
	}

	@Override
	public List<Member> memberHowT2(Map param) {
		// TODO Auto-generated method stub
		return dao.memberHowT2(session, param);
	}

	@Override
	public List<Order> selectOrderList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectOrderList(session,cPage,numPerpage);
	}

	@Override
	public int insertProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.insertProduct1(session,param);
	}

	@Override
	public int updateProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProduct1(session,param);
	}

	@Override
	public EbookDatabind searchBringPrice(int bindNo) {
		// TODO Auto-generated method stub
		return dao.searchBringPrice(session,bindNo);
	}

	@Override
	public int outputProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.outputProduct1(session,param);
	}

	@Override
	public int updateSalesVolume1(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolume1(session,param);
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
