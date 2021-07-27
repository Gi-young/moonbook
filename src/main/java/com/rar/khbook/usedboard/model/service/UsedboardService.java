package com.rar.khbook.usedboard.model.service;

import java.util.List;

import com.rar.khbook.usedboard.model.vo.Usedboard;

public interface UsedboardService {
	List<Usedboard> selectUsedboardList(int cPage, int numPerpage);
	
	int selectUsedboardCount();
	
	List<Usedboard> searchUsedboardList(int cPage, int numPerpage,String catagory);
	
	int searchUsedboardCount(String catagory);
}
