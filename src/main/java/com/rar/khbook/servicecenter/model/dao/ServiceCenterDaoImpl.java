package com.rar.khbook.servicecenter.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.serviceboard.model.vo.NoticeBoard;

@Repository
public class ServiceCenterDaoImpl implements ServiceCenterDao {

	@Override
	public List<NoticeBoard> searchNoticeBoardList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("serviceBoard.searchNoticeBoardList");
	}

}
