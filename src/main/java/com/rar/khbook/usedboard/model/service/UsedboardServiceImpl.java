package com.rar.khbook.usedboard.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.usedboard.model.dao.UsedboardDao;
import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UsedboardServiceImpl implements UsedboardService {
	
	@Autowired
	private UsedboardDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Usedboard> selectUsedboardList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectUsedboardList(session,cPage,numPerpage);
	}
	
	@Override
	public int selectUsedboardCount() {
		// TODO Auto-generated method stub
		return dao.selectUsedboardCount(session);
	}
	
	@Override
	public List<Usedboard> searchUsedboardList(int cPage, int numPerpage,String catagory) {
		// TODO Auto-generated method stub
		return dao.searchUsedboardList(session,cPage,numPerpage,catagory);
	}
	
	@Override
	public int searchUsedboardCount(String catagory) {
		// TODO Auto-generated method stub
		return dao.searchUsedboardCount(session,catagory);
	}
	
	@Override
	public Usedboard selectUsedboardOne(int no) {
		// TODO Auto-generated method stub
		return dao.selectUsedboardOne(session, no);
	}
	
	@Override
	public int selectReplyCount(int no) {
		// TODO Auto-generated method stub
		return dao.selectReplyCount(session, no);
	}
	
	@Override
	public List<Usedcomment> selectReply(int no) {
		// TODO Auto-generated method stub
		return dao.selectReply(session, no);
	}
	
	@Override
	public int insertUsedcomment(Usedcomment c){
		// TODO Auto-generated method stub
		return dao.insertUsedcomment(session,c);
	}
	
	@Override
	public int deleteUsedcomment(int commentNo) {
		// TODO Auto-generated method stub
		return dao.deleteUsedcomment(session,commentNo);
	}
	
	@Override
	public int deleteUsedcommentRef(int commentNo) {
		// TODO Auto-generated method stub
		return dao.deleteUsedcommentRef(session,commentNo);
	}
	
	@Override
	public int usedboardUpdateEnd(Usedboard b) {
		// TODO Auto-generated method stub
		return dao.usedboardUpdateEnd(session,b);
	}
}
