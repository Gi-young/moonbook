package com.rar.khbook.sellbook.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;

public interface SellbookDao {

	SellbookDatabind selectSellbookDatabind(SqlSession session, int bindNo);

	Member checkMember(SqlSession session, String memberId);

	SellbookDatabind selectBigView(SqlSession session, int bindNo);

}
