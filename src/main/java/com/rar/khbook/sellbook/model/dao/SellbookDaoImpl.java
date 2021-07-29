package com.rar.khbook.sellbook.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

@Repository
public class SellbookDaoImpl implements SellbookDao {

	@Override
	public SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo) {
		return session.selectOne("SellbookDatabind.selectSellbookDatabind",bindNo);
	}
	
}
