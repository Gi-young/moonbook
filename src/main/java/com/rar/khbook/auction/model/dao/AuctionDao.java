package com.rar.khbook.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;

public interface AuctionDao {

	List<AuctionCate> selectauctioncate(SqlSession session, String level1);

	AuctionCate selectauctioncateCode(SqlSession session, Map param);

	int auctionWriteEnd(SqlSession session, Auction a);

	List<Auction> selectTimeList(SqlSession session,int cPage, int numPerpage);

	int auctionCount(SqlSession session);

	List<AuctionCate> selectAuctionCate(SqlSession session);

	List<Auction> selectAuctionList(SqlSession session, Map param, int cPage, int numPerpage);

	int auctionListCount(SqlSession session, Map param);

	Auction selectauctionNo(SqlSession session, Map param);

	int insertauctionBid(SqlSession session, Map param);

	int memberpointchange(SqlSession session, Map param);

	void updatestate(SqlSession session);

	List<Auction> selectpoplist(SqlSession session);

}
