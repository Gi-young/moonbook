package com.rar.khbook.gift.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.gift.model.dao.GiftDao;
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
	
}
