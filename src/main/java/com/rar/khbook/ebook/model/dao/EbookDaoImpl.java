package com.rar.khbook.ebook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

@Repository
public class EbookDaoImpl implements EbookDao {

	@Override
	public int insertBookDataIntoDatabase(SqlSession session, Map param) {
		int result = 0;
		try{
			result = session.insert("ebook.insertBookDataIntoDatabase",param);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<EbookDatabind> search(SqlSession session, Map param) {
		int limit = Integer.parseInt((String)param.get("dataVolume"));
		RowBounds rb = new RowBounds(0, limit);
		return session.selectList("ebook.search", param, rb);
	}
	
	@Override
	public int uploadEbook(SqlSession session, Ebook ebook) {
		int result = 0;
		try {
			return session.insert("ebook.uploadEbook", ebook);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Member login(SqlSession session, String memberId) {
		return session.selectOne("ebook.login", memberId);
	}
	
}
