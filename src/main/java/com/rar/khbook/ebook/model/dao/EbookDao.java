package com.rar.khbook.ebook.model.dao;

import java.util.HashMap;
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
	
	EbookDatabind searchOneBook(SqlSession session, int bindNo);
	
	int checkLoved(SqlSession session, Map param);
	
	int checkShopped(SqlSession session, Map param);
	
	int loveBook(SqlSession session, Map param);
	
	int unloveBook(SqlSession session, Map param);
	
	int putInShoppingBasket(SqlSession session, Map param);
	
	int putOutShoppingBasket(SqlSession session, Map param);
	
	List<HashMap> getMyBooksFromBasket(SqlSession session, String loginMemberId);
	
	int writePurchaseLog(SqlSession session, Map param);
	
	int checkClubName(SqlSession session, String clubName);
	
	int createClub(SqlSession session, Map param);
	
	List<HashMap> showMyClubList(SqlSession session, String memberId);
	
	List<HashMap> showClubInfo(SqlSession session, String clubName);
	
	HashMap checkAuthority(SqlSession session, String clubName);
	
	int deleteClub(SqlSession session, String clubName);
	
	int joinClub(SqlSession session, Map param);
	
	int deportMember(SqlSession session, Map param);
	
	int saveMessage(SqlSession session, Map param);
	
	int deleteMessage(SqlSession session, Map param);
	
	List<HashMap> loadMessage(SqlSession session, String memberId);
	
}
