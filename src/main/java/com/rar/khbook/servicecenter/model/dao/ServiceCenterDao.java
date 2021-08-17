package com.rar.khbook.servicecenter.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;

public interface ServiceCenterDao {

	List<NoticeBoard> searchNoticeBoardList(SqlSession session);

	List<EventBoard> searchEventBoardList(SqlSession session);
}
