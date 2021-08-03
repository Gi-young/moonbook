package com.rar.khbook.usedboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

public interface UsedboardDao {
	
	List<Usedboard> selectUsedboardList(SqlSession session, int cPage, int numPerpage);
	
	int selectUsedboardCount(SqlSession session);
	
	List<Usedboard> searchUsedboardList(SqlSession session, int cPage, int numPerpage,String catagory);
	
	int searchUsedboardCount(SqlSession session,String catagory);
	
	Usedboard selectUsedboardOne(SqlSession session, int no);
	
	int selectReplyCount(SqlSession session,int no);
	
	List<Usedcomment> selectReply(SqlSession session,int no);
	
	int insertUsedcomment(SqlSession session, Usedcomment c);
	
	int deleteUsedcomment(SqlSession session, int commentNo);
	
	int deleteUsedcommentRef(SqlSession session, int commentNo);
	
	int usedboardUpdateEnd(SqlSession session, Usedboard b);
	
	int usedboardInsertEnd(SqlSession session, Usedboard b);
	
	int usedboardfileInsertEnd(SqlSession session, Usedboardfile f);
	
	int usedboardDelete(SqlSession session,int no);
	
	int usedcommentDelete(SqlSession session,int no);
	
	int usedboardfileDelete(SqlSession session,int no);
	
	List<Usedboardfile> usedboardfileSelect(SqlSession session,int no);
	
	int usedboardPayment(SqlSession session,int no);
}
