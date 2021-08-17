package com.rar.khbook.serviceboard.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public interface NoticeBoardWriteDao {

	int noticeBoardWrite(SqlSession session, HashMap map);
	
	int deleteNoticeBoard(SqlSession session, int noticeboardNo);
	
	int eventBoardWrite(SqlSession session, HashMap map);
	
	int deleteEventBoard(SqlSession session, int noticeboardNo);
}
