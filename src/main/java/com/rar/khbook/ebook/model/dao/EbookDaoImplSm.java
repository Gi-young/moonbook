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
		RowBounds row = new RowBounds((cPage-1)*numPerpage, numPerpage);
		
			return session.selectList("ebookSm.searchBook", param, row);
		}
}
