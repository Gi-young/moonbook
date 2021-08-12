package com.rar.khbook.gift.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.gift.model.dao.GiftDao;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

@Service
public class GiftServiceImpl implements GiftService {


	@Autowired
	private GiftDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public Member searchMember(String memberId) {
		Member m = dao.searchMember(memberId, session);
		return m;
	}

	@Override
	public List<Ngift> giftAll() {
		List<Ngift> list = dao.giftAll(session);
		return list;
	}

	@Override
	public int insertGift(Map param) {
		int result = dao.insertGift(session, param);
		return result;
	}
	
	@Override
	public Ngift giftOne(int giftNo) {
		Ngift g = dao.giftOne(session, giftNo);
		return g;
	}

	@Override
	public List<GiftBoard>  selectReview(Map param) {
		// TODO Auto-generated method stub
		List<GiftBoard>  gb = dao.selectReview(session, param);
		return gb;
	}
	
	@Override
	public int reviewWrite(HashMap map) {
		// TODO Auto-generated method stub
		int result = dao.reviewWrite(session,map);
		return result;
	}

	@Override
	public int selectReviewAll(int giftNo) {
		// TODO Auto-generated method stub
		int totalData = dao.selectReviewAll(session, giftNo);
		return totalData;
	}
	
	@Override
	public int insertShopingList(Map param) {
		// TODO Auto-generated method stub
		int result = dao.insertShopingList(session, param);
		return result;
	}
	
	/*
	 * @Override public int insertShopingGift(Map param) {
	 * 
	 * try {
	 * 
	 * }catch(Exception e) { e.printStackTrace; }
	 * 
	 * return result; }
	 */
	
	
}
