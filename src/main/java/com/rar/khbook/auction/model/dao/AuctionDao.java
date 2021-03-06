package com.rar.khbook.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionBid;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.auction.model.vo.Bankinfo;
import com.rar.khbook.auction.model.vo.Transaction;
import com.rar.khbook.member.model.vo.Member;

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


	List<Auction> selectpoplist(SqlSession session);

	List<Auction> selectstatelist(SqlSession session);

	void updatestate(SqlSession session, Auction a);

	int auctionStateCount(SqlSession session,Map param);

	List<Auction> selectStateList(SqlSession session, Map param, int cPage, int numPerpage);

	Member selectbidMember(SqlSession session, Map param);

	void updateauctionPay(SqlSession session, Map param);

	int updatestateS(SqlSession session, Map param);

	int updateAddbid(SqlSession session, Map param);

	List<Auction> auctionAdmin(SqlSession session, Map param, int cPage, int numPerpage);

	int auctionBuySell(SqlSession session, Map param);

	int auctionAdmintotal(SqlSession session, Map param);

	int updatebidStateY(SqlSession session, Map param);

	int auctionDel(SqlSession session, Map param);


	int auctionBankCount(SqlSession session, Map param);

	List<Transaction> auctionBank(SqlSession session, Map param, int cPage, int numPerpage);

	List<Bankinfo> selectbank(SqlSession session, Map param);

	void insertBank(SqlSession session, Map param);

	int insertpayoutEnd(SqlSession session, Map param);

	List<AuctionBid> selectbidlist(SqlSession session);

	AuctionBid selectauctiobanner(SqlSession session);

	int updateTransactionY(SqlSession session, Map param);

}
