package com.rar.khbook.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionBid;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.auction.model.vo.Bankinfo;
import com.rar.khbook.auction.model.vo.Transaction;
import com.rar.khbook.member.model.vo.Member;
@Repository
public class AuctionDaoImpl implements AuctionDao {
	
	
	@Override
	public int updateTransactionY(SqlSession session, Map param) {
		return session.update("bank.updateTransactionY",param);
	}

	@Override
	public List<AuctionBid> selectbidlist(SqlSession session) {
		return session.selectList("auction.selectbidlist");
	}
	
	//경매 관리 페이지
	
	
	@Override
	public List<Auction> auctionAdmin(SqlSession session, Map param,int cPage, int numPerpage) {
		RowBounds row=new RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("auction.auctionAdmin",param,row);
	}
	@Override
	public int auctionAdmintotal(SqlSession session, Map param) {
		return session.selectOne("auction.auctionAdmintotal",param);
	}


	@Override
	public int updatestateS(SqlSession session, Map param) {
		return session.update("auction.updatestateS",param);
		
	}

	@Override
	public void updateauctionPay(SqlSession session,Map param) {
		session.update("auction.updateauctionPay",param);
		
	}

	@Override
	public Member selectbidMember(SqlSession session, Map param) {
		return session.selectOne("auction.selectbidMember",param);
	}

	@Override
	public List<Auction> selectStateList(SqlSession session, Map param,int cPage, int numPerpage) {
		RowBounds row=new RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("auction.selectStateList",param,row);
	}

	@Override
	public int auctionStateCount(SqlSession session,Map param) {
		return session.selectOne("auction.auctionStateCount",param);
	}
	
//자동으로 접속하면 업데이트 시켜버리기
	@Override
	public void updatestate(SqlSession session,Auction a) {
		session.update("auction.updatestate",a);
		
	}
	@Override
	public List<Auction> selectstatelist(SqlSession session) {
		return session.selectList("auction.selectstatelist");
		
	}
	@Override
	public int memberpointchange(SqlSession session, Map param) {
		return session.update("auction.memberpointchange",param);
	}
	
	@Override
	public int updateAddbid(SqlSession session, Map param) {
		return session.update("auction.updateAddbid",param);
	}

	@Override
	public int insertauctionBid(SqlSession session, Map param) {
		return session.insert("auction.insertauctionBid",param);
	}
	@Override
	public Auction selectauctionNo(SqlSession session, Map param) {
		return session.selectOne("auction.auctionNo",param);
	}
	@Override
	public int auctionListCount(SqlSession session, Map param) {
		return session.selectOne("auction.auctionListCount",param);
	}
	@Override
	public List<Auction> selectAuctionList(SqlSession session, Map param, int cPage, int numPerpage) {
		RowBounds row=new RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("auction.selectAuctionList",param,row);
	}
	@Override
	public List<AuctionCate> selectAuctionCate(SqlSession session) {
		return session.selectList("auction.selectAuctionCate");
	}
	
	@Override
	public List<Auction> selectpoplist(SqlSession session) {
		return session.selectList("auction.selectpoplist");
	}
	@Override
	public List<Auction> selectTimeList(SqlSession session,int cPage, int numPerpage) {
		RowBounds row=new RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("auction.selectTimeList",null,row);
	}
	@Override
	public int auctionCount(SqlSession session) {
		return session.selectOne("auction.auctionCount");
	}
	@Override
	public int auctionWriteEnd(SqlSession session, Auction a) {
		return session.insert("auction.auctionWriteEnd",a);
	}
	@Override
	public AuctionCate selectauctioncateCode(SqlSession session, Map param) {
		return session.selectOne("auction.selectauctioncateCode",param);
	}


	@Override
	public List<AuctionCate> selectauctioncate(SqlSession session, String level1) {
		return session.selectList("auction.selectauctioncate",level1);
	}

//buysell
	@Override
	public int auctionBuySell(SqlSession session, Map param) {
		return session.update("auction.auctionBuySell",param);
	}
//포인트 회수
	@Override
	public int updatebidStateY(SqlSession session, Map param) {
		return session.update("auction.updatebidStateY",param);
	}
//등록취소
	@Override
	public int auctionDel(SqlSession session, Map param) {
		return session.delete("auction.auctionDel",param);
	}
	///////////////////////////////////////////////////
	@Override
	public List<Transaction> auctionBank(SqlSession session, Map param, int cPage, int numPerpage) {
		RowBounds row=new RowBounds((cPage-1)*numPerpage, numPerpage);
		return session.selectList("bank.auctionBank",param,row);
	}
	@Override
	public int auctionBankCount(SqlSession session, Map param) {
		return session.selectOne("bank.auctionBankCount",param);
	}
	@Override
	public List<Bankinfo> selectbank(SqlSession session,Map param) {
		return session.selectList("bank.selectbank",param);
	}
	@Override
	public void insertBank(SqlSession session, Map param) {
		 session.insert("bank.insertBank",param);
		
	}
	@Override
	public int insertpayoutEnd(SqlSession session, Map param) {
		return session.insert("bank.insertBank2",param);
	}

	@Override
	public AuctionBid selectauctiobanner(SqlSession session) {
		return session.selectOne("auction.selectauctiobanner");
	}
	
	
	

	
	
	
	
}
