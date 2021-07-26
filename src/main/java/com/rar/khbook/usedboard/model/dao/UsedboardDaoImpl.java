package com.rar.khbook.usedboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.usedboard.model.vo.Usedboard;

@Repository
public class UsedboardDaoImpl implements UsedboardDao {
	
	@Override
	public List<Usedboard> selectUsedboardList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.selectUsedboardList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectUsedboardCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.selectUsedboardCount");
	}
	
	@Override
	public List<Usedboard> searchUsedboardList(SqlSession session, int cPage, int numPerpage,String catagory) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.searchUsedboardList",catagory,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int searchUsedboardCount(SqlSession session,String catagory) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.searchUsedboardCount",catagory);
	}
}
