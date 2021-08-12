package com.rar.khbook.sellbook.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.dao.SellbookDao;
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
	public int updateSalesVolumeAdd(Map param) {
		// TODO Auto-generated method stub
		return dao.updateSalesVolumeAdd(session, param);
	}
	
	
}
