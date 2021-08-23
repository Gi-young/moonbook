package com.rar.khbook.sellbook.controller;



import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.service.SellbookService;
import com.rar.khbook.sellbook.model.vo.BookBoard;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.servicecenter.model.service.ServiceCenterService;
import com.rar.khbook.usedboard.model.service.UsedboardService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SellbookController {

	@Autowired
	private SellbookService service;
	
	@Autowired
	private ServiceCenterService service2;
	
	@Autowired
	private UsedboardService service3;
	
	@RequestMapping("/sellbookController/sellbook.do")
	public ModelAndView sellbook(ModelAndView mv) {
		List<EventBoard> eb= service2.searchEventBoardList();
		mv.addObject("event",eb);
		mv.setViewName("sellpart/level1");
		return mv;
		
	}
	
	@RequestMapping("/sellbookController/pageBookSearch.do")
	public String pageBookSearch(@RequestParam String categoryCode, Model model) {
		
		model.addAttribute("categoryCode", categoryCode);
		
		return "sellpart/bookSearch/searchBook";
	}

	@RequestMapping("/sellbookController/bookadong03.do")
	public String bookadong03() {
		return "sellpart/bookadong/bookadong03";
		
	}
	@RequestMapping("/sellbookController/bookadong032.do")
	public String bookadong032() {
		return "sellpart/bookadong/bookadong032";
		
	}
	@RequestMapping("/sellbookController/bookadong47.do")
	public String bookadong47() {
		return "sellpart/bookadong/bookadong47";
		
	}
	@RequestMapping("/sellbookController/bookadong472.do")
	public String bookadong472() {
		return "sellpart/bookadong/bookadong472";
		
	}
	@RequestMapping("/sellbookController/bookadong99.do")
	public String bookadong99() {
		return "sellpart/bookadong/bookadong99";
		
	}
	
	///////////////////////////////
	
	@RequestMapping("/sellbookController/bookadongdonghwa.do")
	public String bookadongdonghwa() {
		return "sellpart/bookadong/bookadongdonghwa";
		
	}
	
	
	@RequestMapping("/sellbookController/sellbookDetail.do")
	public String sellbookDetail() {
		return "sellpart/bookDetail";
		
	}
	
	@RequestMapping("/sellbookController/bookpayment.do")
	public String order() {
		return "sellpart/bookpayment/bookPayment";
	}
	

	@RequestMapping("/sellbookController/bookchodongdonghwa12.do")
	public String bookchodongdonghwa12() {
		return "sellpart/bookchodong/bookchodongdonghwa12";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa34.do")
	public String bookchodongdonghwa34() {
		return "sellpart/bookchodong/bookchodongdonghwa34";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa56.do")
	public String bookchodongdonghwa56() {
		return "sellpart/bookchodong/bookchodongdonghwa56";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa99.do")
	public String bookchodongdonghwa99() {
		return "sellpart/bookchodong/bookchodongdonghwa99";
		
	}
	
	
	@RequestMapping("/sellbookController/bookjoongdong.do")
	public String bookjoongdongmoonhak() {
		return "sellpart/bookjoongdong/bookjoongdong";
		
	}
	
	
	
	
	@RequestMapping("/sellbookController/bookjoongdongworld.do")
	public String bookworldmoonhak() {
		return "sellpart/bookjoongdong/bookjoongdongworld";
		
	}
	
	
	
	
	
	
	@RequestMapping("/sellbookController/bookgojunkorea.do")
	public String bookgojunkorea() {
		return "sellpart/bookgojun/bookgojunkorea";
		
	}
	
	@RequestMapping("/sellbookController/bookgojunworld.do")
	public String bookgojunworld() {
		return "sellpart/bookgojun/bookgojunworld";
		
	}
	
	@RequestMapping(value="/sellpart/bookDetail.do")
	public ModelAndView selectSellbookDatabind(int bindNo, ModelAndView mv, String shopinglistCate) {
		
		mv.addObject("book",service.selectSellbookDatabind(bindNo));
//		장바구니에서 상품 구분을 위한 변수 넘깁니다.
		mv.addObject("shopinglistCate", shopinglistCate);
		mv.setViewName("sellpart/bookDetail");
		return mv;
	}
	@RequestMapping(value="/sellpart/reviewPage.do")
	public ModelAndView reviewPage(ModelAndView mv) {
		
		mv.setViewName("sellpart/bookDetail");
		return mv;
	}
	
	@RequestMapping("/sellbookController/bigview.do") 
	public ModelAndView bigview(int bindNo, ModelAndView mv) {
		mv.addObject("bigview",service.selectBigView(bindNo));
		mv.setViewName("sellpart/bigView");
		return mv;
		
	}
	@RequestMapping("/SellbookController/bookpayment.do") 
	public ModelAndView bookpayment(int bindNo, String sellStock, ModelAndView mv) {
		SellbookDatabind sd = service.selectBookPayment(bindNo);
		mv.addObject("book", sd);
		mv.addObject("shopinglistCate","B");
		mv.addObject("sellStock",sellStock);
		mv.setViewName("sellpart/bookpayment/bookPayment");
		return mv;
	}
	
	@RequestMapping("/SellbookController/order.do") 
	public String order2() {
		return "order/main";
	}
	
	
	@RequestMapping(value = "/sellpart/checkMember.do")
	@ResponseBody
	public Member checkMember(String memberId) {
		Member member = service.checkMember(memberId);
		return member;
	}

	
	@RequestMapping("/SellbookController/salesVolumeAdd.do") 
	@ResponseBody
	public int salesVolumeAdd(@RequestParam Map param) {
		int result = service.updateSalesVolumeAdd(param);
		
		return result;
	}
	
	@RequestMapping("/SellbookControll/insertReview.do")
	public ModelAndView insertReview(int bindNo, ModelAndView mv) {
		SellbookDatabind b = service.bookOne(bindNo);
		mv.addObject("b", b);
		mv.addObject("bindNo", bindNo);
		mv.setViewName("sellpart/insertReviewBook");
		return mv;
	}

	@RequestMapping("/SellbookController/productReview.do")
	@ResponseBody
	public List<BookBoard> review(@RequestParam Map param, Model m) {
		List<BookBoard> bb = service.selectReview(param);
		return bb;
	}
	
	@RequestMapping("/SellbookController/productReview2.do")
	@ResponseBody
	public String reviewPageBar(int bindNo, ModelAndView mv,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "nunPerpage", defaultValue = "10") int numPerpage) {

		int totalData = service.selectReviewAll(bindNo);
		
		String getOwnPageBar = PageFactory.getWonJaePageBar(totalData, cPage, numPerpage);
		return getOwnPageBar;
	}
//	insertReview.jsp 에서 넘어오는 폼 값을 받는 컨트롤러
	@RequestMapping("/SellbookController/reviewWrite.do")
	public ModelAndView reviewWrite(int bindNo, ModelAndView mv, String content, MultipartFile file, int score, String loginMember) {

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("bindNo", bindNo);
		map.put("content", content);
		map.put("img", file);
		map.put("score", score);
		map.put("memberId", loginMember);
			
		int result = service.reviewWrite(map);
		mv.addObject("msg","리뷰가 등록되었습니다.");
		mv.setViewName("servicecenter/msgReview");
		return mv;
	}
	
//주문, 결제
	@RequestMapping("/SellbookController/orderOne.do")
	@ResponseBody()
	private String orderOne(@RequestParam Map param, @SessionAttribute("loginMember")Member m) {
		//포인트 보류, 세션어디다쓰는지 질문
		param.put("addPoint", Math.round((Integer.parseInt((String)param.get("paidAmount"))*0.1)));
		int result = service.orderOne(param);
		return ""+result;
	}	
	
	//환불
	
	@RequestMapping("/SellbookController/cancelPayment.do")
	public ModelAndView cancelPayment(ModelAndView mv, String impUid, String memberId, int no) {
		
		IamportClient client=new IamportClient("5164314186471457",
		"95ea6ac5da33dc78645a3ef90f370cf47dcbfe6fa206a035d511d0211ff20e7e8e9825a4ff41c1ee"
		);
		  
		CancelData cancelData = new CancelData(impUid, true);
		  
		try { 
			IamportResponse<Payment> paymentResponse =
					client.cancelPaymentByImpUid(cancelData); 
		} catch(IamportResponseException e){ 
			
		  
		switch(e.getHttpStatusCode()) {
		case 401: break;
		  
		case 500: break; 
		} 
		} catch(IOException e) {
			e.printStackTrace(); 
		}
		
		int result=service3.cancelPayment(no);
		String msg="";
		if(result>0) {
			msg="환불성공";
		}else {
			msg="환불실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("log","/");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
}
