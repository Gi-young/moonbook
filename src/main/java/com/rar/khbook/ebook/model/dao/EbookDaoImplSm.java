package com.rar.khbook.ebook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

@Repository
public class EbookDaoImplSm implements EbookDaoSm {

//	도서 총 개수
	@Override
	public int bookCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("ebookSm.bookCount");
	}

//	모든 도서 조회
	@Override
	public List<EbookDatabind> selectAllBook(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage - 1) * numPerpage, numPerpage);

		return session.selectList("ebookSm.selectAllBook", null, row);
	}

//	검색 조건에 부합하는 도서 개수
	@Override
	public int searchBookCount(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("ebookSm.searchBookCount", param);
	}

//	검색 조건에 부합하는 도서 조회
	@Override
	public List<EbookDatabind> searchBook(SqlSession session, Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage - 1) * numPerpage, numPerpage);

		return session.selectList("ebookSm.searchBook", param, row);
	}

//	구매할 도서 조회
	@Override
	public EbookDatabind selectBook(SqlSession session, EbookDatabind b) {
		// TODO Auto-generated method stub

		return session.selectOne("ebookSm.selectBook", b);
	}

//	구매한 이북인지 확인
	@Override
	public EbookDatabind checkEbook(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("ebookSm.checkEbook", param);
	}

//	주문 저장
	@Override
	public int insertOrder(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("ebookSm.insertOrder", param);
	}

//	주문 상세 저장
	@Override
	public int insertEbookOrderList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("ebookSm.insertEbookOrderList", param);
	}

//	회원 이북 등록
	@Override
	public int insertMemberEbookList(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("ebookSm.insertMemberEbookList", param);
	}

//	결제 저장
	@Override
	public int insertPayment(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("ebookSm.insertPayment", param);
	}

//	이북 판매량 추가
	@Override
	public int updateBookEbookDatabind(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.update("ebookSm.updateBookEbookDatabind", param);
	}
}
