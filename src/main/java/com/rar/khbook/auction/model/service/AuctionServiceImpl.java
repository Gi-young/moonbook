package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.auction.model.dao.AuctionDao;
import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.auction.model.vo.Bankinfo;
import com.rar.khbook.auction.model.vo.Transaction;
import com.rar.khbook.member.model.vo.Member;
@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionDao dao;
	@Autowired
	private SqlSession session;
	
	


	@Override
	public int auctionAdmintotal(Map param) {
		return dao.auctionAdmintotal(session,param);
	}

	@Override
	public List<Auction> auctionAdmin(Map param,int cPage, int numPerpage) {
		return dao.auctionAdmin(session,param,cPage,numPerpage);
	}

	@Override
	public void updatestateS(Map param) {
		dao.updatestateS(session,param);
		
	}

	@Override
	public void updateauctionPay(Map param) {
		dao.updateauctionPay(session,param);
		
	}

	@Override
	public Member selectbidMember(Map param) {
		return dao.selectbidMember(session,param);
	}

	@Override
	public List<Auction> selectStateList(Map param) {
		return dao.selectStateList(session,param);
	}

	@Override
	public int auctionStateCount(Map param) {
		return dao.auctionStateCount(session,param);
	}

	@Override
	public void updatestate() {
		List<Auction> list=dao.selectstatelist(session);
		for(Auction a:list) {
				System.out.println(a);
				dao.updatestate(session,a);
		}
		
		
		
	}

	@Override
	public int updateAddbid(Map param) {
		int result=dao.updateAddbid(session,param);
		if(result>0) {
			result=dao.memberpointchange(session,param);
			return result;
		}else {
			return 0;
		}

	}

	@Override
	public int insertauctionBid(Map param) {
		int result=dao.insertauctionBid(session,param);
		if(result>0) {
			result=dao.memberpointchange(session,param);
			return result;
		}else {
			return 0;
		}

	}

	@Override
	public Auction selectauctionNo(Map param) {
		return dao.selectauctionNo(session,param);
	}

	@Override
	public int auctionListCount(Map param) {
		return dao.auctionListCount(session,param);
	}

	@Override
	public List<AuctionCate> selectAuctionCate() {
		return dao.selectAuctionCate(session);
	}
	
	@Override
	public List<Auction> selectpoplist() {
		return dao.selectpoplist(session);
	}

	@Override
	public List<Auction> selectTimeList(int cPage,int numPerpage) {
		return dao.selectTimeList(session,cPage,numPerpage);
	}
	
	@Override
	public int auctionCount() {
		return dao.auctionCount(session);
	}

	@Override
	public int auctionWriteEnd(Auction a) {
		return dao.auctionWriteEnd(session,a);
	}


	@Override
	public List<AuctionCate> selectauctioncate(String level1) {		
		return dao.selectauctioncate(session,level1);
	}

	@Override
	public AuctionCate selectauctioncateCode(Map param) {
		return dao.selectauctioncateCode(session,param);
	}

	@Override
	public List<Auction> selectAuctionList(Map param, int cPage, int numPerpage) {
		return dao.selectAuctionList(session,param,cPage,numPerpage);
	}


///buysell
	
	
	@Override
	public int auctionBuySell(Map param) {
		return dao.auctionBuySell(session,param);
	}

	
//admin
	@Override
	public int auctionAdminCal(Map param) {
		dao.updateauctionPay(session,param);
		int result= dao.updatestateS(session, param);
		result=dao.updatebidStateY(session, param);
		return result;
	}
	//포인트 환급

	@Override
	public int auctionbidCollect(Map param) {
		dao.updateauctionPay(session, param);
		int result=dao.updatebidStateY(session,param);
		return result;
	}
	//물품등록 취소

	@Override
	public int auctionDel(Map param) {
		return dao.auctionDel(session,param);
	}
	//////////////////////////////////////////////////////////

	@Override
	public List<Transaction> auctionBank(Map param, int cPage, int numPerpage) {
		return dao.auctionBank(session,param,cPage,numPerpage);
	}

	@Override
	public int auctionBankCount(Map param) {
		return dao.auctionBankCount(session,param);
	}

	@Override
	public List<Bankinfo> selectbank(Map param) {
		return dao.selectbank(session,param);
	}

	@Override
	public void insertBank(Map param) {
		dao.insertBank(session,param);
	}

	@Override
	public int insertpayoutEnd(Map param) {
		dao.insertpayoutEnd(session,param);
		return dao.memberpointchange(session, param);
	}
	
	

	
	
	

}
