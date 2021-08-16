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
	
	List<HashMap> getMyEbooks(SqlSession session, Map param);
	
	String getEbookFilepath(SqlSession session, String bindNo);
	
	int createSort(SqlSession session, Map param);
	
	List<String> listMySorts(SqlSession session, String memberId);
	
	int changeSort(SqlSession session, Map param);
	
	int cleanPseudoSortRow(SqlSession session, Map param);
	
	int deleteSort(SqlSession session, Map param);
	
	int cleanData(SqlSession session);
	
	List<HashMap> changeBookshelf(SqlSession session, Map param);
	
	int dataCountFromSort(SqlSession session, Map param);
	
	int liftFromSort(SqlSession session, Map param);
	
	int dataCountAll(SqlSession session, Map param);
	
	List<HashMap> loadMusic(SqlSession session);
	
	HashMap getTodayRecord(SqlSession session, String loginMemberId);
	
	int insertTodayRecord(SqlSession session, String loginMemberId);
	
	int countReadPage(SqlSession session, String loginMemberId);
	
	int countReadTime(SqlSession session, String loginMemberId);
	
	List<HashMap> getBasicBookMarks(SqlSession session, int bindNo);
	
	int createCustomBookMark(SqlSession session, Map param);
	
	List<HashMap> getCustomBookmark(SqlSession session, Map param);
	
	int deleteCustomBookmark(SqlSession session, Map param);
	
	int lastPage(SqlSession session, Map param);
	
	int getLastPage(SqlSession session, String bindNo, String loginMemberId);
	
	List<HashMap> getBookCategory(SqlSession session);
	
	List<HashMap> newSearch(SqlSession session, Map param);
	
	int getTotalData(SqlSession session, Map param);
	
	List<HashMap> getCategories(SqlSession session, Map param);
	
}
