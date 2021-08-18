package com.rar.khbook.usedboard.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.UsedboardPayment;
import com.rar.khbook.usedboard.model.vo.UsedboardSingo;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

public interface UsedboardService {
	List<Usedboard> selectUsedboardList(int cPage, int numPerpage,Map<String,Object> map);
	
	int selectUsedboardCount(Map<String,Object> map);
	
	Usedboard selectUsedboardOne(int no);
	
	int selectReplyCount(int no);
	
	List<Usedcomment> selectReply(int no);
	
	int insertUsedcomment(Usedcomment c);
	
	int deleteUsedcomment(int commentNo);
	
	int deleteUsedcommentRef(int commentNo);
	
	int usedboardUpdateEnd(Usedboard b);
	
	int usedboardInsertEnd(Usedboard b) throws Exception;
	
	int usedboardDelete(int no);
	
	List<Usedboardfile> usedboardfileSelect(int no);
	
	int usedboardPayment(int no, UsedboardPayment p);
	
	List<UsedboardPayment> usedboardMyPaymentList(int cPage, int numPerpage,String memberId);
	  
	int usedboardMyPaymentCount(String memberId);
	
	int usedboardPay1(int no);
	
	int usedboardPay2(int no);
	
	List<UsedboardSingo> checkSingo(UsedboardSingo s);
	
	int insertSingo(UsedboardSingo s);
	
	List<UsedboardSingo> usedboardSingoList(int cPage, int numPerpage);
	
	int usedboardSingoCount();
	
	int usedboardSingoDelete(int no);
	
	int usedboardMySingoDelete(int no);
	
	int cancelPayment(int no);
	
	int usedboardFileUpload(Usedboardfile f);
}
