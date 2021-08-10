package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.auction.model.dao.AuctionDao;
import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.member.model.vo.Member;
@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionDao dao;
	@Autowired
	private SqlSession session;
	
	


	@Override
	public List<Auction> auctionAdmin(Map param) {
		return dao.auctionAdmin(session,param);
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
		return result;
	}
	

}
