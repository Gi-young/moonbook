package com.rar.khbook.serviceboard.model.service;

import java.util.HashMap;


public interface NoticeBoardWriteService {

	int noticeBoardWrite(HashMap<String, Object> map);
	int deleteNoticeBoard(int noticeboardNo);
}
