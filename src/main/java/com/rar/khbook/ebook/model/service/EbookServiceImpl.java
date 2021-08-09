package com.rar.khbook.ebook.model.service;

import java.util.HashMap;
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
	public int checkShopped(Map param) {
		int result = dao.checkShopped(session, param);
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
	
	@Override
	public int putInShoppingBasket(Map param) {
		int result = dao.putInShoppingBasket(session, param);
		return result;
	}
	
	@Override 
	public int putOutShoppingBasket(Map param) {
		int result = dao.putOutShoppingBasket(session, param);
		return result;
	}
	
	@Override
	public List<HashMap> getMyBooksFromBasket(String loginMemberId) {
		List<HashMap> list = dao.getMyBooksFromBasket(session, loginMemberId);
		return list;
	}
	
	@Override
	public int writePurchaseLog(Map param) {
		int result = dao.writePurchaseLog(session, param);
		return result;
	}
	
	@Override
	public int checkClubName(String clubName) {
		int result = dao.checkClubName(session, clubName);
		return result;
	}
	
	@Override
	public int createClub(Map param) {
		int result = dao.createClub(session, param);
		return result;
	}
	
	@Override
	public List<HashMap> showMyClubList(String memberId) {
		List<HashMap> list = dao.showMyClubList(session, memberId);
		return list;
	}
	
	@Override
	public List<HashMap> showClubInfo(String clubName) {
		List<HashMap> list = dao.showClubInfo(session, clubName);
		return list;
	}
	
	@Override
	public HashMap checkAuthority(String clubName) {
		return dao.checkAuthority(session, clubName);
	}
	
	@Override
	public int deleteClub(String clubName) {
		return dao.deleteClub(session, clubName);
	}
	
	@Override
	public int joinClub(Map param) {
		return dao.joinClub(session, param);
	}
	
	@Override
	public int deportMember(Map param) {
		return dao.deportMember(session, param);
	}
	
	@Override
	public int saveMessage(Map param) {
		return dao.saveMessage(session, param);
	}
	
	@Override
	public int deleteMessage(Map param) {
		return dao.deleteMessage(session, param);
	}
	
	@Override
	public List<HashMap> loadMessage(String memberId) {
		return dao.loadMessage(session, memberId);
	}
	
	@Override
	public List<HashMap> getMyEbooks(Map param) {
		return dao.getMyEbooks(session, param);
	}
	
	@Override
	public String getEbookFilepath(String bindNo) {
		return dao.getEbookFilepath(session, bindNo);
	}
	
	@Override
	public int createSort(Map param) {
		return dao.createSort(session, param);
	}
	
	@Override
	public List<String> listMySorts(String memberId) {
		return dao.listMySorts(session, memberId);
	}
	
	@Override
	public int changeSort(Map param) {
		return dao.changeSort(session, param);
	}
	
	@Override
	public int cleanPseudoSortRow(Map param) {
		return dao.cleanPseudoSortRow(session, param);
	}
	
	@Override
	public int deleteSort(Map param) {
		return dao.deleteSort(session, param);
	}
	
	@Override
	public int cleanData() {
		return dao.cleanData(session);
	}
	
	@Override
	public List<HashMap> changeBookshelf(Map param) {
		return dao.changeBookshelf(session, param);
	}
	
	@Override
	public int dataCountFromSort(Map param) {
		return dao.dataCountFromSort(session, param);
	}
	
	@Override
	public int liftFromSort(Map param) {
		return dao.liftFromSort(session, param);
	}
	
	@Override
	public int dataCountAll(Map param) {
		return dao.dataCountAll(session, param);
	}
	
	@Override
	public List<HashMap> loadMusic() {
		return dao.loadMusic(session);
	}
	
	@Override
	public HashMap getTodayRecord(String loginMemberId) {
		return dao.getTodayRecord(session, loginMemberId);
	}
	
	@Override
	public int insertTodayRecord(String loginMemberId) {
		return dao.insertTodayRecord(session, loginMemberId);
	}
	
	@Override
	public int countReadPage(String loginMemberId) {
		return dao.countReadPage(session, loginMemberId);
	}
	
	@Override
	public int countReadTime(String loginMemberId) {
		return dao.countReadTime(session, loginMemberId);
	}
	
	@Override
	public List<HashMap> getBasicBookMarks(int bindNo) {
		return dao.getBasicBookMarks(session, bindNo);
	}
	
	@Override
	public int createCustomBookMark(Map param) {
		return dao.createCustomBookMark(session, param);
	}
	
	@Override
	public List<HashMap> getCustomBookmark(Map param) {
		return dao.getCustomBookmark(session, param);
	}
	
}
