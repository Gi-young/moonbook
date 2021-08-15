package com.rar.khbook.usedboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.UsedboardPayment;
import com.rar.khbook.usedboard.model.vo.UsedboardSingo;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

@Repository
public class UsedboardDaoImpl implements UsedboardDao {
	
	@Override
	public List<Usedboard> selectUsedboardList(SqlSession session, int cPage, int numPerpage,Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.selectUsedboardList",map,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectUsedboardCount(SqlSession session,Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.selectUsedboardCount",map);
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
	
	@Override
	public int usedboardInsertEnd(SqlSession session, Usedboard b) {
		// TODO Auto-generated method stub
		return session.insert("usedboard.usedboardInsertEnd",b);
	}
	
	@Override
	public int usedboardfileInsertEnd(SqlSession session, Usedboardfile f) {
		// TODO Auto-generated method stub
		return session.insert("usedboard.usedboardfileInsertEnd",f);
	}
	
	@Override
	public int usedboardDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.usedboardDelete",no);
	}
	
	@Override
	public int usedcommentDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.usedcommentDelete",no);
	}
	
	@Override
	public int usedboardfileDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.usedboardfileDelete",no);
	}
	
	@Override
	public List<Usedboardfile> usedboardfileSelect(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.usedboardfileSelect",no);
	}
	
	@Override
	public int usedboardPayment(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPayment",no);
	}
	
	@Override
	public int usedboardPaymentInsert(SqlSession session, UsedboardPayment p) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPaymentInsert",p);
	}
	
	@Override
	public List<UsedboardPayment> usedboardMyPaymentList(SqlSession session, int cPage, int numPerpage,
			String memberId) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.usedboardMyPaymentList",memberId,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int usedboardMyPaymentCount(SqlSession session, String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.usedboardMyPaymentCount",memberId);
	}
	
	@Override
	public int usedboardPay1(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPay1",no);
	}
	
	@Override
	public int usedboardPay11(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPay11",no);
	}
	
	@Override
	public int usedboardPay2(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPay2",no);
	}
	
	@Override
	public int usedboardPay22(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.usedboardPay22",no);
	}
	
	@Override
	public List<UsedboardSingo> checkSingo(SqlSession session, UsedboardSingo s) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.checkSingo",s);
	}
	
	@Override
	public int insertSingo(SqlSession session, UsedboardSingo s) {
		// TODO Auto-generated method stub
		return session.insert("usedboard.insertSingo",s);
	}
	
	@Override
	public List<UsedboardSingo> usedboardSingoList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("usedboard.usedboardSingoList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}
	
	@Override
	public int usedboardSingoCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("usedboard.usedboardSingoCount");
	}
	
	@Override
	public int usedboardSingoDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.usedboardSingoDelete",no);
	}
	
	@Override
	public int usedboardMySingoDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("usedboard.usedboardMySingoDelete",no);
	}
	
	@Override
	public int usedboardDeliveryt(SqlSession session, UsedboardPayment p) {
		// TODO Auto-generated method stub
		return session.insert("usedboard.usedboardDeliveryt",p);
	}
	
	@Override
	public int cancelPayment(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.cancelPayment",no);
	}
	
	@Override
	public int cancelPaymentUpdate(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.update("usedboard.cancelPaymentUpdate",no);
	}
}
