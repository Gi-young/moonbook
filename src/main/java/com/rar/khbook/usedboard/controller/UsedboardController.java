package com.rar.khbook.usedboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.usedboard.model.service.UsedboardService;
import com.rar.khbook.usedboard.model.vo.Usedboard;
import com.rar.khbook.usedboard.model.vo.UsedboardPayment;
import com.rar.khbook.usedboard.model.vo.UsedboardSingo;
import com.rar.khbook.usedboard.model.vo.Usedboardfile;
import com.rar.khbook.usedboard.model.vo.Usedcomment;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsedboardController {
	
	@Autowired
	private UsedboardService service;

	@RequestMapping("/usedboard/usedboardList.do")
	public ModelAndView usedboardPage(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5") int numPerpage,
			ModelAndView mv,HttpServletRequest request) {
		String memberId=request.getParameter("memberId");
		String catagory=request.getParameter("catagory");
		String keyword=request.getParameter("keyword");
		String searchType=request.getParameter("searchType");
		Map<String,Object> map = new HashMap<>();
		if(keyword!=null&&searchType!=null&&memberId!=null) {
			map.put("keyword", "'"+keyword+"'");
	        map.put("searchType", searchType);
	        map.put("keyword2", "'"+memberId+"'");
	        map.put("searchType2", "memberId");
	        mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getUsedboardPageBar(totalData, cPage, numPerpage, "usedboardList.do?memberId="+memberId+"&keyword="+keyword+"&searchType="+searchType));
			
	        mv.setViewName("usedboard/usedboardList");
		}else if(keyword!=null&&searchType!=null&&catagory!=null) {
			map.put("keyword", "'"+keyword+"'");
	        map.put("searchType", searchType);
	        map.put("keyword2", "'"+catagory+"'");
	        map.put("searchType2", "catagory");
	        mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getUsedboardPageBar(totalData, cPage, numPerpage, "usedboardList.do?catagory="+catagory+"&keyword="+keyword+"&searchType="+searchType));
			
			mv.setViewName("usedboard/usedboardList");
		}else if(keyword!=null&&searchType!=null) {
			map.put("keyword", "'"+keyword+"'");
	        map.put("searchType", searchType);
	        mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getUsedboardPageBar(totalData, cPage, numPerpage, "usedboardList.do?keyword="+keyword+"&searchType="+searchType));
			
			mv.setViewName("usedboard/usedboardList");
		}else if(memberId!=null) {
			map.put("keyword2", "'"+memberId+"'");
	        map.put("searchType2", "memberId");
			mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getUsedboardPageBar(totalData, cPage, numPerpage, "usedboardList.do?memberId="+memberId));
			
			mv.setViewName("usedboard/usedboardList");
		}else if(catagory==null) {
			mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "usedboardList.do"));
			
			mv.setViewName("usedboard/usedboardList");
		}else {
			String cata=catagory.replace("'","%27");
			map.put("keyword2", catagory);
	        map.put("searchType2", "catagory");
			mv.addObject("list",service.selectUsedboardList(cPage,numPerpage,map));
			int totalData=service.selectUsedboardCount(map);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getUsedboardPageBar(totalData, cPage, numPerpage,"usedboardList.do?catagory="+cata));
			
			mv.setViewName("usedboard/usedboardList");
		}
		return mv;
		
	}
	
	@RequestMapping("/usedboard/usedboardView.do")
	public ModelAndView usedboardView(int no, ModelAndView mv) {
		mv.addObject("usedboard",service.selectUsedboardOne(no));
		mv.addObject("reply",service.selectReply(no));
		mv.addObject("replycount",service.selectReplyCount(no));
		mv.addObject("no",no);
		mv.setViewName("usedboard/usedboardView");
		return mv;
	}
	
	@RequestMapping("/usedboard/insertUsedcomment.do")
	public ModelAndView insertUsedcomment(Usedcomment c,ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedbaord_No"));
		int result=service.insertUsedcomment(c);
		String msg="";
		if(result==1) {
			msg="등록성공";
		}else {
			msg="등록실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/deleteUsedcomment.do")
	public ModelAndView deleteUsedcomment(ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedbaord_No"));
		int commentNo=Integer.parseInt(req.getParameter("usedcomment_No"));
		int result=service.deleteUsedcomment(commentNo);
		int result2=service.deleteUsedcommentRef(commentNo);
		String msg="";
		if(result==1) {
			msg="삭제성공";
		}else {
			msg="삭제실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardUpdate.do")
	public ModelAndView usedboardUpdate(int no,Usedboard b, ModelAndView mv) {
		mv.addObject("usedboard",service.selectUsedboardOne(no));
		mv.addObject("no",no);
		mv.setViewName("usedboard/usedboardUpdate");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardUpdateEnd.do")
	public ModelAndView usedboardUpdateEnd(Usedboard b,ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedboard_No"));
		String msg="";
		int result=service.usedboardUpdateEnd(b);
		if(result==1) {
			msg="변경성공";
		}else {
			msg="변경실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardInsert.do")
	public String usedboardInsert() {
		return "/usedboard/usedboardInsert";
	}
	
	@RequestMapping("/usedboard/usedboardInsertEnd.do")
	public ModelAndView usedboardInsertEnd(Usedboard b,MultipartFile[] upFile,ModelAndView mv,HttpServletRequest req) {
		log.debug("Usedboard : "+b);
		String path=req.getServletContext().getRealPath("/resources/upload/usedboard/");
		File dir=new File(path);//폴더
		if(!dir.exists()) dir.mkdirs();
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String oriFilename=f.getOriginalFilename();
				String ext=oriFilename.substring(oriFilename.lastIndexOf("."));
				
				//리네임규칙설정하기
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndNum=(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				
				//리네임으로 파일업로드 처리하기
				//MultipartFile객체를 이용해서 저장처리를 해야함.
				//transfetTo()매소드를 이용 -> 하드에 파일을 저장
				try {
					f.transferTo(new File(path+reName));
					b.getUsedboardfiles().add(Usedboardfile.builder().usedboardfile_Oriname(oriFilename).usedboardfile_Rename(reName).build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		String msg="등록성공";
		try {
			service.usedboardInsertEnd(b);
		}catch(Exception e) {
			msg=e.getMessage();
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardList.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardDelete.do")
	public ModelAndView usedboardDelete(int no, ModelAndView mv,HttpServletRequest req) {
		if(req.getParameter("singoNo")!=null) {
			int singoNo=Integer.parseInt(req.getParameter("singoNo"));
			int result2=service.usedboardSingoDelete(singoNo);
		}
		int result3=service.usedboardMySingoDelete(no);
		List<Usedboardfile> f=service.usedboardfileSelect(no);
		String path=req.getServletContext().getRealPath("/resources/upload/usedboard/");
		String paths="";
		for(Usedboardfile ff : f) {
			paths=path+ff.getUsedboardfile_Rename();
			File deleteFile=new File(paths);
			deleteFile.delete();
		}
		int result=service.usedboardDelete(no);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제성공";
			loc="/usedboard/usedboardList.do";
		}else {
			msg="삭제실패";
			loc="/usedboard/usedboardView.do?no="+no;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardPayment.do")
	public ModelAndView usedboardPayment(int no,UsedboardPayment p, ModelAndView mv,HttpServletRequest req) {
		p.setUsedboardPayment_Title(req.getParameter("title"));
		p.setUsedboardPayment_Price(Integer.parseInt(req.getParameter("price")));
		p.setUsedboardPayment_BoardNo(Integer.parseInt(req.getParameter("no")));
		p.setImp_uid(req.getParameter("impuid"));
		p.setMerchant_uid(req.getParameter("muid"));
		p.setMember_Id(req.getParameter("id"));
		System.out.println(p);
		int result=service.usedboardPayment(no,p);
		String msg="";
		String loc="";
		if(result>0) {
			msg="결제성공";
		}else {
			msg="결제실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardMyPayment.do")
	public ModelAndView usedboardMyPayment(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv,HttpServletRequest request,String memberId) {
		mv.addObject("list",service.usedboardMyPaymentList(cPage,numPerpage,memberId));
		int totalData=service.usedboardMyPaymentCount(memberId);
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "usedboardMyPayment.do"));
		mv.setViewName("usedboard/usedboardMyPayment");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardPay1.do")
	public ModelAndView usedboardPay1(int no, ModelAndView mv,String memberId) {
		int result=service.usedboardPay1(no);
		String msg="";
		if(result>0) {
			msg="주문확인성공";
		}else {
			msg="주문확인실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardList.do?memberId="+memberId);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardPay2.do")
	public ModelAndView usedboardPay2(int no, ModelAndView mv,String id) {
		int result=service.usedboardPay2(no);
		String msg="";
		if(result>0) {
			msg="배송완료성공";
		}else {
			msg="배송완료실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardMyPayment.do?memberId="+id);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardSingo.do")
	public ModelAndView usedboardSingo(int no, ModelAndView mv,String id,UsedboardSingo s) {
		s.setUsedboardsingo_Id(id);
		s.setUsedboardsingo_BoardNo(no);
		List<UsedboardSingo> check=service.checkSingo(s);
		String msg="";
		if(check.isEmpty()) {
			int result=service.insertSingo(s);
			if(result>0) {
				msg="신고가 완료되었습니다";
			}else {
				msg="신고에 실패하였습니다";
			}
		}else {
			msg="이미 신고하셨습니다";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardSingoList.do")
	public ModelAndView usedboardSingo (@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
			ModelAndView mv,HttpServletRequest request) {
		mv.addObject("list",service.usedboardSingoList(cPage,numPerpage));
		int totalData=service.usedboardSingoCount();
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "usedboardSingoList.do"));
		mv.setViewName("usedboard/usedboardSingoList");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardSingoDelete.do")
	public ModelAndView usedboardSingoDelete(ModelAndView mv,int no) {
		int result=service.usedboardSingoDelete(no);
		String msg="";
		if(result>0) {
			msg="신고취소성공";
		}else {
			msg="신고취소실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardSingoList.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/cancelPayment.do")
	public ModelAndView cancelPayment(ModelAndView mv,String impUid, String memberId,int no) {
		
		IamportClient client=new IamportClient("0768547382405749",
		"e4c8f1e4c9e5df5739bd3606eb54377dd91cb7ece251b3252997588d1aff94070c0e0fa5edbb1324"
		);
		  
		CancelData cancelData = new CancelData(impUid, true);
		  
		try { IamportResponse<Payment> paymentResponse =
		client.cancelPaymentByImpUid(cancelData); } catch(IamportResponseException e)
		{ System.out.println(e.getMessage());
		  
		switch(e.getHttpStatusCode()) { case 401: break;
		  
		case 500: break; } } catch(IOException e) { e.printStackTrace(); }
		
		int result=service.cancelPayment(no);
		String msg="";
		if(result>0) {
			msg="환불성공";
		}else {
			msg="환불실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardMyPayment.do?memberId="+memberId);
		mv.setViewName("common/msg");
		return mv;
	}
	
}
