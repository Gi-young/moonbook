package com.rar.khbook.serviceboard.model.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.serviceboard.model.dao.NoticeBoardWriteDao;

@Service
public class NoticeBoardWriteServiceImpl implements NoticeBoardWriteService {

	@Autowired
	private NoticeBoardWriteDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public int noticeBoardWrite(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.noticeBoardWrite(session, map);
	}

	@Override
	public int deleteNoticeBoard(int noticeboardNo) {
		// TODO Auto-generated method stub
		return dao.deleteNoticeBoard(session,noticeboardNo);
	}
	@Override
	public int eventBoardWrite(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.eventBoardWrite(session, map);
	}
	
	@Override
	public int deleteEventBoard(int noticeboardNo) {
		// TODO Auto-generated method stub
		return dao.deleteEventBoard(session,noticeboardNo);
	}

	
}
