package com.rar.khbook.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<Member> selectMemberList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectMemberCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberCount");
	}

	@Override
	public int memberDelete(SqlSession session, String memberId) {
		// TODO Auto-generated method stub
		return session.delete("member.memberDelete",memberId);
	}

	@Override
	public int memberUpdate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("member.memberUpdate",param);
	}

	@Override
	public List<Member> memberHowT(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		System.out.println(param);
		return session.selectList("member.memberHowT",param);
	}

	@Override
	public List<Member> memberHowT2(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("member.memberHowT2",param);
	}
	@Override
	public List<Order> selectOrderList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("order.selectOrderList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int insertProduct1(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProduct1",param);
	}

	@Override
	public int updateProduct1(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("admin.updateProduct1",param);
	}

	@Override
	public EbookDatabind searchBringPrice(SqlSession session, int bindNo) { // 책가격 가져오기
		// TODO Auto-generated method stub
		return session.selectOne("admin.searchBringPrice",bindNo);
	}
	@Override
	public EbookDatabind checkStock1(SqlSession session, int bindNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.checkStock1",bindNo);
	}

	@Override
	public int outputProduct1(SqlSession session, Map param) { //출고 book
		// TODO Auto-generated method stub
		return session.update("admin.outputProduct1",param);
	}

	@Override
	public int updateSalesVolume1(SqlSession session, Map param) { //출고후 판매량 +update 로직 book
		// TODO Auto-generated method stub
		return session.update("admin.updateSalesVolume1",param);
	}
	//잠만 ebook은 입고는 공통인데 출고가 다름 ebook은 판매량+1만 하면됨

	//재고현황
	@Override
	public List<EbookDatabind> selectEbookDatabindList(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("admin.selectEbookDatabindList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectEbookDataCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectEbookDataCount");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
}
