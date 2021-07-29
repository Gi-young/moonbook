package com.rar.khbook.sellbook.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

public interface SellbookDao {

	SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo);

}
