package com.rar.khbook.gift.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.gift.model.dao.GiftDao;
import com.rar.khbook.gift.model.vo.Gift;
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
	
}
