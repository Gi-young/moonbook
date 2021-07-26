package com.rar.khbook.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.admin.model.dao.AdminDao;
import com.rar.khbook.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Member> selectMemberList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,cPage,numPerpage);
	}

	@Override
	public int selectMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberCount(session);
	}

	@Override
	public int memberDelete(String memberId) {
		// TODO Auto-generated method stub
		return dao.memberDelete(session,memberId);
	}

	@Override
	public int memberUpdate(Map param) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(session,param);
	}
	
	
	
	
	
	
	
	
}
