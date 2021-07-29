package com.rar.khbook.ebook.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

public interface EbookDao {

	int insertBookDataIntoDatabase(SqlSession session, Map param);
	
	List<EbookDatabind> search(SqlSession session, Map param);
	
	int uploadEbook(SqlSession session, Ebook ebook);
	
	Member login(SqlSession session, String memberId);
	
}
