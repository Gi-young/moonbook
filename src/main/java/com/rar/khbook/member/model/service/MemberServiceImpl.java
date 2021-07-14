package com.rar.khbook.member.model.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.member.model.dao.MemberDao;
import com.rar.khbook.member.model.vo.Member;



@Service
public class MemberServiceImpl implements MemberService {

//	@Autowired
//	private MemberDao dao;
	@Autowired
	private SqlSession session;
	

//	@Override
//	public int insertMember(Member m) {
//		// TODO Auto-generated method stub
////		return dao.insertMember(session, m);
//		return 0;
//	}

	
	
	
	
	
}
