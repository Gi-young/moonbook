package com.rar.khbook.ebook.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.rar.khbook.ebook.model.dao.EbookDaoSm;
import com.rar.khbook.ebook.model.vo.EbookDatabind;

@Primary()
@Service()
public class EbookServiceImplSm implements EbookServiceSm {
	
	@Autowired
	private EbookDaoSm dao;
	
	@Autowired
	private SqlSession session;
	
//	도서 총 개수
	@Override
	public int bookCount() {
		// TODO Auto-generated method stub
		return dao.bookCount(session);
	}
	
//	모든 도서 조회
	@Override
	public List<EbookDatabind> selectAllBook(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectAllBook(session, cPage, numPerpage);
	}
	
//	검색 조건에 부합하는 도서 개수
	@Override
	public int searchBookCount(Map param) {
		// TODO Auto-generated method stub
		return dao.searchBookCount(session, param);
	}
	
//	검색 조건에 부합하는 도서 조회
	@Override
	public List<EbookDatabind> searchBook(Map param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.searchBook(session, param, cPage, numPerpage);
	}
}
