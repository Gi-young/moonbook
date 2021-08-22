package com.rar.khbook.servicecenter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.servicecenter.model.vo.Faq;


@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {

	@Override
	public List<NoticeBoard> searchNoticeBoardList(SqlSession session) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds(0, 3);
		
		return session.selectList("serviceBoard.searchNoticeBoardList",null,rb);
	}

	@Override
	public List<EventBoard> searchEventBoardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("serviceBoard.searchEventBoardList");
	}

	//faq 시작
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
	public NoticeBoard searchNoticeBoardDetail(SqlSession session, int noticeboardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("serviceBoard.searchNoticeBoardDetail",noticeboardNo);
	}

	@Override
	public EventBoard searchEventBoardDetail(SqlSession session, int eventboardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("serviceBoard.searchEventBoardDetail", eventboardNo);
	}

	@Override
	public int searchAvgRating(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("serviceBoard.searchAvgRating", param);
	}

	
}
