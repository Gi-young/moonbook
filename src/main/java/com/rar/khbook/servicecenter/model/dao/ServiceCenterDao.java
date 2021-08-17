package com.rar.khbook.servicecenter.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.servicecenter.model.vo.Faq;

public interface ServiceCenterDao {

	
	
	
	
	List<Faq> selectFaqList(SqlSession session);
	
	int inputAskFaq(SqlSession session,Map param);
	
	List<Faq> searchFaq(SqlSession session,Map param);



	List<NoticeBoard> searchNoticeBoardList(SqlSession session);

	List<EventBoard> searchEventBoardList(SqlSession session);

}
