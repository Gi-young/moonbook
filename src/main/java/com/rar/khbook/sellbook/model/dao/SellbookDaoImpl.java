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
		System.out.println("DAO임");
		
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
	public int selectReviewAll(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("SellbookDatabind.selectReviewAll", bindNo);
	}
	
}
