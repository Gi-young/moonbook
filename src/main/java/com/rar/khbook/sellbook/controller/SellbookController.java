package com.rar.khbook.sellbook.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SellbookController {

	@Autowired
	private SellbookService service;
	
	@RequestMapping("/sellbookController/sellbook.do")
	public String sellbook() {
		System.out.println("나와라이놈아2");
		return "sellpart/level1";
		
	}

	@RequestMapping("/sellbookController/bookadong03.do")
	public String bookadong03() {
		System.out.println("한국그림책");
		return "sellpart/bookadong/bookadong03";
		
	}
	@RequestMapping("/sellbookController/bookadong032.do")
	public String bookadong032() {
		System.out.println("한국그림책");
		return "sellpart/bookadong/bookadong032";
		
	}
	@RequestMapping("/sellbookController/bookadong47.do")
	public String bookadong47() {
		System.out.println("한국그림책");
		return "sellpart/bookadong/bookadong47";
		
	}
	@RequestMapping("/sellbookController/bookadong472.do")
	public String bookadong472() {
		System.out.println("한국그림책");
		return "sellpart/bookadong/bookadong472";
		
	}
	@RequestMapping("/sellbookController/bookadong99.do")
	public String bookadong99() {
		System.out.println("한국그림책");
		return "sellpart/bookadong/bookadong99";
		
	}
	
	///////////////////////////////
	
	@RequestMapping("/sellbookController/bookadongdonghwa.do")
	public String bookadongdonghwa() {
		System.out.println("아동동화");
		return "sellpart/bookadong/bookadongdonghwa";
		
	}
	
	
	@RequestMapping("/sellbookController/sellbookDetail.do")
	public String sellbookDetail() {
		System.out.println("나와라이놈아2");
		return "sellpart/bookDetail";
		
	}
	
	@RequestMapping("/sellbookController/bookpayment.do")
	public String order() {
		System.out.println("북페이먼트까지 성공");
		return "sellpart/bookpayment/bookPayment";
	}
	

	@RequestMapping("/sellbookController/bookchodongdonghwa12.do")
	public String bookchodongdonghwa12() {
		System.out.println("초등동화");
		return "sellpart/bookchodong/bookchodongdonghwa12";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa34.do")
	public String bookchodongdonghwa34() {
		System.out.println("초등동화");
		return "sellpart/bookchodong/bookchodongdonghwa34";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa56.do")
	public String bookchodongdonghwa56() {
		System.out.println("초등동화");
		return "sellpart/bookchodong/bookchodongdonghwa56";
		
	}
	@RequestMapping("/sellbookController/bookchodongdonghwa99.do")
	public String bookchodongdonghwa99() {
		System.out.println("초등동화");
		return "sellpart/bookchodong/bookchodongdonghwa99";
		
	}
	
	
	@RequestMapping("/sellbookController/bookjoongdong.do")
	public String bookjoongdongmoonhak() {
		System.out.println("중등문학");
		return "sellpart/bookjoongdong/bookjoongdong";
		
	}
	
	
	
	
	@RequestMapping("/sellbookController/bookjoongdongworld.do")
	public String bookworldmoonhak() {
		System.out.println("세계문학");
		return "sellpart/bookjoongdong/bookjoongdongworld";
		
	}
	
	
	
	
	
	
	@RequestMapping("/sellbookController/bookgojunkorea.do")
	public String bookgojunkorea() {
		System.out.println("한국고전");
		return "sellpart/bookgojun/bookgojunkorea";
		
	}
	
	@RequestMapping("/sellbookController/bookgojunworld.do")
	public String bookgojunworld() {
		System.out.println("세계고전");
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
	
	@RequestMapping("/sellbookController/bigview.do") 
	public ModelAndView bigview(int bindNo, ModelAndView mv) {
		System.out.println("페이지이동");
		mv.addObject("bigview",service.selectBigView(bindNo));
		mv.setViewName("bigview");
		return mv;
		
	}
	@RequestMapping("/SellbookController/bookpayment.do") 
	public ModelAndView bookpayment(int bindNo, String sellStock, ModelAndView mv) {
		System.out.println("결제할 책 데이터 넘기기 여긴가");
		System.out.println(bindNo+100000);
		System.out.println("판매수량"+sellStock);
		SellbookDatabind sd = service.selectBookPayment(bindNo);
		System.out.println("야야 이거 나오니???????????? : "+sd);
		mv.addObject("book", sd);
		mv.addObject("shopinglistCate","B");
		mv.addObject("sellStock",sellStock);
		mv.setViewName("sellpart/bookpayment/bookPayment");
		System.out.println("mv임"+mv);
		return mv;
	}
	
	@RequestMapping("/SellbookController/order.do") 
	public String order2() {
		System.out.println("결제할 책 데이터 넘기기");
		return "order/main";
	}
	
	
	@RequestMapping(value = "/sellpart/checkMember.do")
	@ResponseBody
	public Member checkMember(String memberId) {
		System.out.println("DAO이전입니다.");
		Member member = service.checkMember(memberId);
		System.out.println("DAO이후입니다.");
		System.out.println("멤버 넘어오니?" + member);
		return member;
	}

	
	@RequestMapping("/SellbookController/salesVolumeAdd.do") 
	@ResponseBody
	public int salesVolumeAdd(@RequestParam Map param) {
		System.out.println("판매량수치 넘기기");
		System.out.println("판매수량"+param);
		int result = service.updateSalesVolumeAdd(param);
		
		return result;
	}
	
	@RequestMapping("/SellbookController/insertReview.do")
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
		System.out.println("param 이다 이게바로 : "+param);
		List<BookBoard> bb = service.selectReview(param);
		System.out.println("bb다 이게바로 : "+bb);
		return bb;
	}
	
	@RequestMapping("/SellbookController/productReview2.do")
	@ResponseBody
	public String reviewPageBar(int bindNo, ModelAndView mv,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "nunPerpage", defaultValue = "10") int numPerpage) {

		int totalData = service.selectReviewAll(bindNo);
		
		System.out.println("totalData" + totalData);

		String getOwnPageBar = PageFactory.getWonJaePageBar(totalData, cPage, numPerpage);
		System.out.println(getOwnPageBar);
		return getOwnPageBar;
	}
//	insertReview.jsp 에서 넘어오는 폼 값을 받는 컨트롤러
	@RequestMapping("/SellbookController/reviewWrite.do")
	public ModelAndView reviewWrite(int bindNo, ModelAndView mv, String content, MultipartFile file, int score, String loginMember) {
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + bindNo);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + content);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + file);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + score);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + loginMember);

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("bindNo", bindNo);
		map.put("content", content);
		map.put("img", file);
		map.put("score", score);
		map.put("memberId", loginMember);
			
		int result = service.reviewWrite(map);

		/*
		 * mv.addObject("msg", ); mv.addObject("loc", ); mv.setViewName("");
		 */
		
		mv.setViewName("sellpart/bookDetail.do?bindNo="+bindNo);
		return mv;
	}
}
