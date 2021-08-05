package com.rar.khbook.sellbook.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.sellbook.model.service.SellbookService;
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
	
	@RequestMapping("/sellbookController/order.do")
	public String order() {
		
		return "order/main";
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
	public ModelAndView selectSellbookDatabind(int bindNo, ModelAndView mv) {
		
		mv.addObject("book",service.selectSellbookDatabind(bindNo));
		mv.setViewName("sellpart/bookDetail");
		return mv;
	}
	
	@RequestMapping("/sellbookController/bigview.do") //모델엔 뷰로 넘ㅈ기기
	public ModelAndView bigview(int bindNo, ModelAndView mv) {
		System.out.println("페이지이동");
		mv.addObject("bigview",service.selectBigView(bindNo));
		mv.setViewName("bigview");
		return mv;
		
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

	
}
