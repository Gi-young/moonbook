package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.member.model.vo.Member;

public interface AuctionService {

	int auctionWriteEnd(Auction a);

	List<AuctionCate> selectauctioncate(String level1);

	AuctionCate selectauctioncateCode(Map param);

	List<Auction> selectTimeList(int cPage, int numPerpage);

	int auctionCount();

	List<AuctionCate> selectAuctionCate();

	List<Auction> selectAuctionList(Map param, int cPage, int numPerpage);

	int auctionListCount(Map param);

	Auction selectauctionNo(Map param);

	int insertauctionBid(Map param);

	void updatestate();

	List<Auction> selectpoplist();

	int auctionStateCount(Map param);//마이리스트

	List<Auction> selectStateList(Map param);

	Member selectbidMember(Map param);

	void updateauctionPay(Map param);

	void updatestateS(Map param);
	



	
}
