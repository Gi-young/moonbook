package com.rar.khbook.usedboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

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
	
	@Override
	public Usedboard selectUsedboardOne(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.selectUsedboardOne",no);
	}
	
	@Override
	public int selectReplyCount(SqlSession session, int no) {
		return session.selectOne("usedboard.selectReplyCount",no);
	}
	
	@Override
	public List<Usedcomment> selectReply(SqlSession session, int no) {
		return session.selectList("usedboard.selectReply",no);
	}
	
	@Override
	public int insertUsedcomment(SqlSession session, Usedcomment c) {
		// TODO Auto-generated method stub
		return session.insert("usedboard.insertUsedcomment",c);
	}
	
	@Override
	public int deleteUsedcomment(SqlSession session, int commentNo) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.deleteUsedcomment",commentNo);
	}
	
	@Override
	public int deleteUsedcommentRef(SqlSession session, int commentNo) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.deleteUsedcommentRef",commentNo);
	}
	
	@Override
	public int usedboardUpdateEnd(SqlSession session, Usedboard b) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardUpdateEnd",b);
	}
	
}
