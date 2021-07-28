package com.rar.khbook.usedboard.model.service;

import java.util.List;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

public interface UsedboardService {
	List<Usedboard> selectUsedboardList(int cPage, int numPerpage);
	
	int selectUsedboardCount();
	
	List<Usedboard> searchUsedboardList(int cPage, int numPerpage,String catagory);
	
	int searchUsedboardCount(String catagory);
	
	Usedboard selectUsedboardOne(int no);
	
	int selectReplyCount(int no);
	
	List<Usedcomment> selectReply(int no);
	
	int insertUsedcomment(Usedcomment c);
}
