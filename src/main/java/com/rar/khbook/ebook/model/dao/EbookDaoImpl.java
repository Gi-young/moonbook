package com.rar.khbook.ebook.model.dao;

import java.util.HashMap;
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
	
	@Override
	public EbookDatabind searchOneBook(SqlSession session, int bindNo) {
		return session.selectOne("ebook.searchOneBook", bindNo);
	}
	
	@Override
	public int checkLoved(SqlSession session, Map param) {
		return session.selectOne("ebook.checkLoved", param);
	}
	
	@Override
	public int checkShopped(SqlSession session, Map param) {
		return session.selectOne("ebook.checkShopped", param);
	}
	
	@Override
	public int loveBook(SqlSession session, Map param) {
		return session.insert("ebook.loveBook", param);
	}
	
	@Override
	public int unloveBook(SqlSession session, Map param) {
		return session.delete("ebook.unloveBook", param);
	}
	
	@Override
	public int putInShoppingBasket(SqlSession session, Map param) {
		return session.insert("ebook.putInShoppingBasket", param);
	}
	
	@Override
	public int putOutShoppingBasket(SqlSession session, Map param) {
		return session.delete("ebook.putOutShoppingBasket", param);
	}
	
	@Override
	public List<HashMap> getMyBooksFromBasket(SqlSession session, String loginMemberId) {
		return session.selectList("ebook.getMyBooksFromBasket", loginMemberId);
	}
	
	@Override
	public int writePurchaseLog(SqlSession session, Map param) {
		return session.insert("ebook.writePurchaseLog", param);
	}
	
	@Override
	public int checkClubName(SqlSession session, String clubName) {
		return session.selectOne("ebook.checkClubName", clubName);
	}
	
	@Override
	public int createClub(SqlSession session, Map param) {
		return session.insert("ebook.createClub", param);
	}
	
	@Override
	public List<HashMap> showMyClubList(SqlSession session, String memberId) {
		return session.selectList("ebook.showMyClubList", memberId);
	}
	
	@Override
	public List<HashMap> showClubInfo(SqlSession session, String clubName) {
		return session.selectList("ebook.showClubInfo", clubName);
	}
	
	@Override
	public HashMap checkAuthority(SqlSession session, String clubName) {
		return session.selectOne("ebook.checkAuthority", clubName);
	}
	
	@Override
	public int deleteClub(SqlSession session, String clubName) {
		return session.delete("ebook.deleteClub", clubName);
	}
	
	@Override
	public int joinClub(SqlSession session, Map param) {
		return session.insert("ebook.joinClub", param);
	}
	
	@Override
	public int deportMember(SqlSession session, Map param) {
		return session.delete("ebook.deportMember", param);
	}
	
	@Override
	public int saveMessage(SqlSession session, Map param) {
		return session.insert("ebook.saveMessage", param);
	}
	
	@Override
	public int deleteMessage(SqlSession session, Map param) {
		return session.delete("ebook.deleteMessage", param);
	}
	
	@Override
	public List<HashMap> loadMessage(SqlSession session, String memberId) {
		return session.selectList("ebook.loadMessage", memberId);
	}
	
}
