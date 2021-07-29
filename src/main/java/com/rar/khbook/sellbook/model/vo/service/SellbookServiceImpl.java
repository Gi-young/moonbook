package com.rar.khbook.sellbook.model.vo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
