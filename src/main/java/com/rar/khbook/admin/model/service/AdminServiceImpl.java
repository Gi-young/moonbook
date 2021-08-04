package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.rar.khbook.admin.model.dao.AdminDao;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Gift;
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
	public int getPageBarOrderedMemberList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderedMemberList(session,param);
	}

	@Override
	public List<Member> memberHowT2(Map param) {
		// TODO Auto-generated method stub
		return dao.memberHowT2(session, param);
	}
	

	@Override
	public int getPageBarSearchTextMemberList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarSearchTextMemberList(session,param);
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
	public int insertProduct3(Map param) {
		// TODO Auto-generated method stub
		return dao.insertProduct3(session, param);
	}

	@Override
	public int updateProduct1(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProduct1(session,param);
	}
	
	@Override
	public int updateProduct3(Map param) {
		// TODO Auto-generated method stub
		return dao.updateProduct3(session, param);
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
	@Override
	public int updateSalesVolume2(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolume2(session,param);
	}
	
	@Override
	public int outputAndupdateSalesVolume3(Map param) {
		// TODO Auto-generated method stub
		return dao.outputAndupdateSalesVolume3(session,param);
	}

	@Override
	public EbookDatabind checkStock1(int bindNo) {
		// TODO Auto-generated method stub
		return dao.checkStock1(session,bindNo);
	}
	
	@Override
	public Gift checkStock3(int gift_no) {
		// TODO Auto-generated method stub
		return dao.checkStock3(session, gift_no);
	}

	@Override
	public List<EbookDatabind> selectEbookDatabindList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectEbookDatabindList(session,cPage,numPerpage);
	}

	@Override
	public int selectEbookDataCount() {
		// TODO Auto-generated method stub
		return dao.selectEbookDataCount(session);
	}

	@Override
	public List<Gift> selectGiftList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectGiftList(session,cPage,numPerpage);
	}

	@Override
	public int selectGiftCount() {
		// TODO Auto-generated method stub
		return dao.selectGiftCount(session);
	}

	@Override
	public List<EbookDatabind> orderStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.orderStockList(session,param);
	}
	
	@Override
	public int getPageBarOrderList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderList(session,param);
	}

	@Override
	public List<Gift> orderStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.orderStockList3(session,param);
	}
	

	@Override
	public int getPageBarOrderList3(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarOrderList3(session,param);
	}

	@Override
	public List<EbookDatabind> searchTextStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextStockList(session,param);
	}
	
	@Override
	public int getPageBarTextStockList(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarTextStockList(session,param);
	}

	@Override
	public List<Gift> searchTextStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.searchTextStockList3(session,param);
	}
	
	@Override
	public int getPageBarTextStockList3(Map param) {
		// TODO Auto-generated method stub
		return dao.getPageBarTextStockList3(session,param);
	}

	@Override
	public int stockTUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTUpdate(session,param);
	}

	@Override
	public int stockTUpdate2(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTUpdate2(session, param);
	}

	@Override
	public int stockTDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTDelete(session,param);
	}

	@Override
	public int stockTDelete2(Map param) {
		// TODO Auto-generated method stub
		return dao.stockTDelete2(session,param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
