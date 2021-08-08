package com.rar.khbook.ebook.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

public interface EbookService {

	int insertBookDataIntoDatabase(Map param);
	
	List<EbookDatabind> search(Map param);

	int uploadEbook(Ebook ebook);
	
	Member login(String memberId);
	
	EbookDatabind searchOneBook(int bindNo);
	
	int checkLoved(Map param);
	
	int checkShopped(Map param);
	
	int loveBook(Map param);
	
	int unloveBook(Map param);
	
	int putInShoppingBasket(Map param);
	
	int putOutShoppingBasket(Map param);
	
	List<HashMap> getMyBooksFromBasket(String loginMemberId);
	
	int writePurchaseLog(Map param);
	
	int checkClubName(String clubName);
	
	int createClub(Map param);
	
	List<HashMap> showMyClubList(String memberId);
	
	List<HashMap> showClubInfo(String clubName);
	
	HashMap checkAuthority(String clubName);
	
	int deleteClub(String clubName);
	
	int joinClub(Map param);
	
	int deportMember(Map param);
	
	int saveMessage(Map param);
	
	int deleteMessage(Map param);
	
	List<HashMap> loadMessage(String memberId);
	
	List<HashMap> getMyEbooks(Map param);
	
	String getEbookFilepath(String bindNo);
	
	int createSort(Map param);
	
	List<String> listMySorts(String memberId);
	
	int changeSort(Map param);
	
	int cleanPseudoSortRow(Map param);
	
	int deleteSort(Map param);
	
	int cleanData();
	
	List<HashMap> changeBookshelf(Map param);
	
	int dataCountFromSort(Map param);
	
	int liftFromSort(Map param);
	
	int dataCountAll(Map param);
	
}
