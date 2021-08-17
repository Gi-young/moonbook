package com.rar.khbook.serviceboard.model.dao;

import java.util.HashMap;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeBoardWriteDaoImpl implements NoticeBoardWriteDao {

	@Override
	public int noticeBoardWrite(SqlSession session, HashMap map) {
		// TODO Auto-generated method stub
		System.out.println("매퍼가기 전 map이라요 : "+map);
		return session.insert("serviceBoard.noticeBoardWrite",map);
	}

	@Override
	public int deleteNoticeBoard(SqlSession session, int noticeboardNo) {
		// TODO Auto-generated method stub
		return session.delete("serviceBoard.deleteNoticeBoard",noticeboardNo);
	}
	
	@Override
	public int eventBoardWrite(SqlSession session, HashMap map) {
		// TODO Auto-generated method stub
		System.out.println("매퍼가기 전 map이라요 : "+map);
		return session.insert("serviceBoard.eventBoardWrite",map);
	}
	
	@Override
	public int deleteEventBoard(SqlSession session, int noticeboardNo) {
		// TODO Auto-generated method stub
		return session.delete("serviceBoard.deleteEventBoard",noticeboardNo);
	}

	
}
