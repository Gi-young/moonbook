package com.rar.khbook.auction.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.auction.model.vo.Bankinfo;
import com.rar.khbook.auction.model.vo.Transaction;
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

	int updateAddbid(Map param);


	List<Auction> auctionAdmin(Map param, int cPage, int numPerpage);
	int auctionBuySell(Map param);

	int auctionAdminCal(Map param);

	int auctionAdmintotal(Map param);

	int auctionbidCollect(Map param);

	int auctionDel(Map param);

	List<Transaction> auctionBank(Map param, int cPage, int numPerpage);

	int auctionBankCount(Map param);

	List<Bankinfo> selectbank(Map param);

	void insertBank(Map param);

	int insertpayoutEnd(Map param);
	



	
}
