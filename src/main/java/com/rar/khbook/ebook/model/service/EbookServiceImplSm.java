package com.rar.khbook.ebook.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rar.khbook.ebook.model.dao.EbookDaoSm;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.dao.MemberDao;

@Primary()
@Service()
public class EbookServiceImplSm implements EbookServiceSm {

	@Autowired
	private EbookDaoSm dao;

	@Autowired
	private SqlSession session;

	@Autowired
	private MemberDao mDao;

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

//	구매할 도서 조회
	@Override
	public EbookDatabind selectBook(EbookDatabind b) {
		// TODO Auto-generated method stub
		return dao.selectBook(session, b);
	}

//	구매한 이북인지 확인
	@Override
	public EbookDatabind checkEbook(Map param) {
		// TODO Auto-generated method stub
		return dao.checkEbook(session, param);
	}

//	주문 및 결제
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int orderOne(Map param) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = dao.insertOrder(session, param);
			if (result > 0) {
				result = dao.insertEbookOrderList(session, param);
				if (result > 0) {
					result = mDao.updateMemberPoint(session, param);
					result = dao.insertMemberEbookList(session, param);
					result = dao.insertPayment(session, param);
					result = dao.updateBookEbookDatabind(session, param);
				}
			}
		} catch (RuntimeException e) {
			System.out.println("등록실패");
		}

		return result;
	}
}
