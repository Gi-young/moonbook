package com.rar.khbook.sellbook.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

public interface SellbookDao {

	SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo);

	Member checkMember(SqlSession session, String memberId);

	SellbookDatabind selectBigView(SqlSession session, int bindNo);

	SellbookDatabind selectBookPayment(SqlSession session, int bindNo);

	int updateSalesVolumeAdd(SqlSession session, Map param);
	
	SellbookDatabind bookOne(SqlSession session, int bindNo);
	
	List<BookBoard>  selectReview(SqlSession session, Map param);
	
	int reviewWrite(SqlSession session, HashMap map);

	int selectReviewAll(SqlSession session, int bindNo);
	
	int insertOrder(SqlSession session, Map param);
	
	int insertBookOrderList(SqlSession session, Map param);
	
	int insertPayment(SqlSession session, Map param);
	
	int updateMemberTotalSale(SqlSession session, Map param);
	
	int updateSalesVolume(SqlSession session, Map param);
	
	int updateStock(SqlSession session, Map param);
	
	int updateMemberPoint(SqlSession session, Map param);
	
}
