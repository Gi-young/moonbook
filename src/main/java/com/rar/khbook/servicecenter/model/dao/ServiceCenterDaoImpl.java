package com.rar.khbook.servicecenter.model.dao;

import java.util.List;

import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.rar.khbook.servicecenter.model.vo.Faq;

import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;


@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Faq> selectFaqList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectFaqList");
	}

	@Override
	public int inputAskFaq(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.inputAskFaq",param);
	}

	@Override
	public List<Faq> searchFaq(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchFaq",param);
	}
	
	
	

	@Override
	public List<NoticeBoard> searchNoticeBoardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("serviceBoard.searchNoticeBoardList");
	}

	@Override
	public List<EventBoard> searchEventBoardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("serviceBoard.searchEventBoardList");
	}


	
}
