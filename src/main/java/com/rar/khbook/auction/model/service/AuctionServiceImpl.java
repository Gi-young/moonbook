package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.auction.model.dao.AuctionDao;
import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionDao dao;
	@Autowired
	private SqlSession session;
	
	


	@Override
	public void updatestate() {
		dao.updatestate(session);
		
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

}
