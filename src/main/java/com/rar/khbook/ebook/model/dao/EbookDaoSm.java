package com.rar.khbook.ebook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.ebook.model.vo.EbookDatabind;

public interface EbookDaoSm {

//	도서 총 개수
	int bookCount(SqlSession session);
	
//	모든 도서 조회
	List<EbookDatabind> selectAllBook(SqlSession session, int cPage, int numPerpage);
	
//	검색 조건에 부합하는 도서 개수
	int searchBookCount(SqlSession session, Map param);
	
//	검색 조건에 부합하는 도서 조회
	List<EbookDatabind> searchBook(SqlSession session, Map param, int cPage, int numPerpage);
	
//	구매할 도서 조회
	EbookDatabind selectBook(SqlSession session, EbookDatabind b);
	
//	구매한 이북인지 확인
	EbookDatabind checkEbook(SqlSession session, Map param);
	
//	주문 저장
	int insertOrder(SqlSession session, Map param);
	
//	주문 상세 저장
	int insertEbookOrderList(SqlSession session, Map param);
	
//	회원에 이북 등록
	int insertMemberEbookList(SqlSession session, Map param);
	
//	결제 저장
	int insertPayment(SqlSession session, Map param);
	
//	판매량 추가
	int updateBookEbookDatabind(SqlSession session, Map param);
}
