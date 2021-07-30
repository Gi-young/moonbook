package com.rar.khbook.ebook.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.ebook.model.dao.EbookDao;
import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

@Service
public class EbookServiceImpl implements EbookService {

	@Autowired
	private EbookDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertBookDataIntoDatabase(Map param) {
		int result = dao.insertBookDataIntoDatabase(session, param);
		return result;
	}
	
	@Override
	public List<EbookDatabind> search(Map param) {
		List<EbookDatabind> list = dao.search(session, param);
		return list;
	}
	
	@Override
	public int uploadEbook(Ebook ebook) {
		int result = dao.uploadEbook(session, ebook);
		return result;
	}
	
	@Override
	public Member login(String memberId) {
		Member loginMember = dao.login(session, memberId);
		return loginMember;
	}
	
	@Override
	public EbookDatabind searchOneBook(int bindNo) {
		EbookDatabind b = dao.searchOneBook(session, bindNo);
		return b;
	}
	
	@Override
	public int checkLoved(Map param) {
		int result = dao.checkLoved(session, param);
		return result;
	}
	
	@Override
	public int loveBook(Map param) {
		int result = dao.loveBook(session, param);
		return result;
	}
	
	@Override
	public int unloveBook(Map param) {
		int result = dao.unloveBook(session, param);
		return result;
	}
	
}
