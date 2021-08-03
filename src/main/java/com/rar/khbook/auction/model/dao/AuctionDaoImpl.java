package com.rar.khbook.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
@Repository
public class AuctionDaoImpl implements AuctionDao {
	
	
	
	
//자동으로 접속하면 업데이트 시켜버리기
	@Override
	public void updatestate(SqlSession session) {
		session.update("auction.updatestate");
		
	}
	@Override
	public int memberpointchange(SqlSession session, Map param) {
		return session.update("auction.memberpointchange",param);
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

}
