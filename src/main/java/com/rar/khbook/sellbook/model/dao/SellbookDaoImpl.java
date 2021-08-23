package com.rar.khbook.sellbook.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

@Repository
public class SellbookDaoImpl implements SellbookDao {

	@Override
	public SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo) {
		return session.selectOne("SellbookDatabind.selectSellbookDatabind",bindNo);
	}

	@Override
	public Member checkMember(SqlSession session, String memberId) {
		
		return session.selectOne("SellbookDatabind.checkMember",memberId);
	}

	@Override
	public SellbookDatabind selectBigView(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectBigView",bindNo);
	}

	@Override
	public SellbookDatabind selectBookPayment(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectBookPayment",bindNo);
	}
	
	@Override
	public SellbookDatabind bookOne(SqlSession session,int bindNo) {
		return session.selectOne("SellbookDatabind.selectBookOne", bindNo);
	}
	
	@Override
	public int updateSalesVolumeAdd(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.updateSalesVolumeAdd",param);
	}
	
	@Override
	public List<BookBoard> selectReview(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerPage = Integer.parseInt((String)param.get("numPerPage"));
		
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return session.selectList("SellbookDatabind.selectReview", param, rb);
	}

	@Override
	public int reviewWrite(SqlSession session, HashMap map) {
		return session.insert("SellbookDatabind.insertReview", map);
	}

	
	@Override
	public int insertReviewBook(SqlSession session, HashMap map) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.insertReviewBook", map);
	}

	@Override
	public int selectReviewAll(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectReviewAll", bindNo);
	}

	@Override
	public int insertOrder(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("SellbookDatabind.insertOrder", param);
	}

	@Override
	public int insertBookOrderList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("SellbookDatabind.insertBookOrderList",param);
	}

	@Override
	public int insertPayment(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("SellbookDatabind.insertPayment",param);
	}

	@Override
	public int updateMemberTotalSale(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.updateMemberTotalSale",param);
	}

	@Override
	public int updateSalesVolume(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.updateSalesVolume",param);
	}

	@Override
	public int updateStock(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.updateStock",param);
	}

	@Override
	public int updateMemberPoint(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.updateMemberPoint",param);
	}

	@Override
	public int cancelPayment(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.cancelPayment",no);
	}
	
	@Override
	public int cancelPaymentUpdate(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("SellbookDatabind.cancelPaymentUpdate",no);
	}
	
}
