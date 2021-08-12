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
}
