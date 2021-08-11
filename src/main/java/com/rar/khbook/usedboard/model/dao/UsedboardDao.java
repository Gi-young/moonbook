package com.rar.khbook.usedboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.UsedboardPayment;
import com.rar.khbook.usedboard.model.vo.UsedboardSingo;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

public interface UsedboardDao {
	
	List<Usedboard> selectUsedboardList(SqlSession session, int cPage, int numPerpage,Map<String,Object> map);
	
	int selectUsedboardCount(SqlSession session,Map<String,Object> map);
	
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
	
	int usedboardPaymentInsert(SqlSession session,UsedboardPayment p);
	
	List<UsedboardPayment> usedboardMyPaymentList(SqlSession session, int cPage, int numPerpage,String memberId);
	
	int usedboardMyPaymentCount(SqlSession session,String memberId);
	
	int usedboardPay1(SqlSession session,int no);
	
	int usedboardPay11(SqlSession session,int no);
	
	int usedboardPay2(SqlSession session,int no);
	
	int usedboardPay22(SqlSession session,int no);
	
	List<UsedboardSingo> checkSingo(SqlSession session,UsedboardSingo s);
	
	int insertSingo(SqlSession session,UsedboardSingo s);
	
	List<UsedboardSingo> usedboardSingoList(SqlSession session, int cPage, int numPerpage);
	
	int usedboardSingoCount(SqlSession session);
	
	int usedboardSingoDelete(SqlSession session,int no);
	
	int usedboardMySingoDelete(SqlSession session,int no);
	
	int usedboardDeliveryt(SqlSession session,UsedboardPayment p);
}
