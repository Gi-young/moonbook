package com.rar.khbook.servicecenter.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.servicecenter.model.dao.ServiceCenterDao;
import com.rar.khbook.servicecenter.model.vo.Faq;

@Service
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterDao dao;
	
	@Autowired
	private SqlSession session;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Faq> selectFaqList() {
		// TODO Auto-generated method stub
		return dao.selectFaqList(session);
	}
	@Override
	public int inputAskFaq(Map param) {
		// TODO Auto-generated method stub
		return dao.inputAskFaq(session,param);
	}
	@Override
	public List<Faq> searchFaq(Map param) {
		// TODO Auto-generated method stub
		return dao.searchFaq(session,param);
	}
	
	
	
	
}
