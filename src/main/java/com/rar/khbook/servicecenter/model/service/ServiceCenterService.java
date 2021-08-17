package com.rar.khbook.servicecenter.model.service;

import java.util.List;

import java.util.Map;

import com.rar.khbook.servicecenter.model.vo.Faq;
import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;

public interface ServiceCenterService {

	List<Faq> selectFaqList();
	int inputAskFaq(Map param);
	
	List<Faq> searchFaq(Map param);






	List<NoticeBoard> searchNoticeBoardList();

	List<EventBoard> searchEventBoardList();

}
