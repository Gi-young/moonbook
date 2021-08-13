package com.rar.khbook.sellbook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.dao.SellbookDao;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;


@Service
public class SellbookServiceImpl implements SellbookService {

	@Autowired
	private SellbookDao dao;
	
	@Autowired
	private SqlSession session;
	
	

	@Override
	public SellbookDatabind selectSellbookDatabind(int bindNo) {

		return dao.selectSellbookDatabind(session, bindNo);
	}



	@Override
	public Member checkMember(String memberId) {
		
		return dao.checkMember(session, memberId);
	}



	@Override
	public SellbookDatabind selectBigView(int bindNo) {
		// TODO Auto-generated method stub
		return dao.selectBigView(session, bindNo);
	}



	@Override
	public SellbookDatabind selectBookPayment(int bindNo) {
		// TODO Auto-generated method stub
		return dao.selectBookPayment(session, bindNo);
	}

	@Override
	public SellbookDatabind bookOne(int bindNo) {
		SellbookDatabind b = dao.bookOne(session, bindNo);
		return b;
	}
	
	@Override
	public int updateSalesVolumeAdd(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolumeAdd(session, param);
	}
	
	@Override
	public List<BookBoard>  selectReview(Map param) {
		// TODO Auto-generated method stub
		List<BookBoard>  gb = dao.selectReview(session, param);
		return gb;
	}
	
	@Override
	public int reviewWrite(HashMap map) {
		// TODO Auto-generated method stub
		int result = dao.reviewWrite(session,map);
		return result;
	}

	@Override
	public int selectReviewAll(int bindNo) {
		// TODO Auto-generated method stub
		int totalData = dao.selectReviewAll(session, bindNo);
		return totalData;
	}
}
