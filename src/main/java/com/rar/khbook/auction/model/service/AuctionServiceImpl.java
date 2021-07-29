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

}
