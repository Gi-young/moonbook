package com.rar.khbook.usedboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.usedboard.model.dao.UsedboardDao;
import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.UsedboardPayment;
import com.rar.khbook.usedboard.model.vo.UsedboardSingo;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
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
	public List<Usedboard> selectUsedboardList(int cPage, int numPerpage,Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.selectUsedboardList(session,cPage,numPerpage,map);
	}
	
	@Override
	public int selectUsedboardCount(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.selectUsedboardCount(session,map);
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
	
	@Override
	public int usedboardInsertEnd(Usedboard b) throws Exception {
		// TODO Auto-generated method stub
		try {
			int result=dao.usedboardInsertEnd(session,b);
			int usedboardNo=b.getUsedboard_No();
			Map<String,Object> map = new HashMap<>();
			map.put("id", b.getMember_Id());
			map.put("no", usedboardNo);
			dao.usedboardFileUpdate(session,map);
			if(result>0) {
				List<Usedboardfile> usedboardfiles=b.getUsedboardfiles();
				if(usedboardfiles.size()>0) {
					for(Usedboardfile f : usedboardfiles) {
						f.setUsedboard_No(usedboardNo);
						dao.usedboardfileInsertEnd(session,f);
					}
				}else if(result>0) return 1;
				else return 0;
			}else return 0;
		}catch(RuntimeException e) {
			throw new RuntimeException("등록실패");
		}
		return 1;
	}
	
	@Override
	public int usedboardDelete(int no) {
		// TODO Auto-generated method stub
		dao.usedcommentDelete(session,no);
		dao.usedboardfileDelete(session,no);
		return dao.usedboardDelete(session,no);
	}
	
	@Override
	public List<Usedboardfile> usedboardfileSelect(int no) {
		// TODO Auto-generated method stub
		return dao.usedboardfileSelect(session, no);
	}
	
	@Override
	public int usedboardPayment(int no,UsedboardPayment p) {
		// TODO Auto-generated method stub
		dao.usedboardPaymentInsert(session,p);
		dao.usedboardDeliveryt(session,p);
		return dao.usedboardPayment(session,no);
	}
	
	@Override
	public List<UsedboardPayment> usedboardMyPaymentList(int cPage, int numPerpage, String memberId) {
		// TODO Auto-generated method stub
		return dao.usedboardMyPaymentList(session,cPage,numPerpage,memberId);
	}
	
	@Override
	public int usedboardMyPaymentCount(String memberId) {
		// TODO Auto-generated method stub
		return dao.usedboardMyPaymentCount(session,memberId);
	}
	
	@Override
	public int usedboardPay1(int no) {
		// TODO Auto-generated method stub
		dao.usedboardPay11(session,no);
		return dao.usedboardPay1(session,no);
	}
	
	@Override
	public int usedboardPay2(int no) {
		// TODO Auto-generated method stub
		dao.usedboardPay22(session,no);
		return dao.usedboardPay2(session,no);
	}
	
	@Override
	public List<UsedboardSingo> checkSingo(UsedboardSingo s) {
		// TODO Auto-generated method stub
		return dao.checkSingo(session,s);
	}
	
	@Override
	public int insertSingo(UsedboardSingo s) {
		// TODO Auto-generated method stub
		return dao.insertSingo(session,s);
	}
	
	@Override
	public List<UsedboardSingo> usedboardSingoList(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.usedboardSingoList(session,cPage,numPerpage);
	}
	
	@Override
	public int usedboardSingoCount() {
		// TODO Auto-generated method stub
		return dao.usedboardSingoCount(session);
	}
	
	@Override
	public int usedboardSingoDelete(int no) {
		// TODO Auto-generated method stub
		return dao.usedboardSingoDelete(session,no);
	}
	
	@Override
	public int usedboardMySingoDelete(int no) {
		// TODO Auto-generated method stub
		return dao.usedboardMySingoDelete(session,no);
	}
	
	@Override
	public int cancelPayment(int no) {
		// TODO Auto-generated method stub
		dao.cancelPaymentUpdate(session,no);
		return dao.cancelPayment(session,no);
	}
	
	@Override
	public int usedboardFileUpload(Usedboardfile f) {
		// TODO Auto-generated method stub
		return dao.usedboardFileUpload(session,f);
	}
}
