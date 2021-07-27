package com.rar.khbook.sellbook.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.sellbook.model.service.SellbookService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SellbookController {

	@Autowired
	private SellbookService service;
	
	@RequestMapping("/sellbookController/sellbook.do")
	public String sellbook() {
		System.out.println("나와라이놈아2");
		return "sellpart/bookDetail";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="/ebook/pageEbook.do")
//	public String pageEbook() {
//		return "ebook/home/ebookHome";
//	}
//	
//	@RequestMapping(value="/ebook/pageBookstallJuvenile.do")
//	public String pageBookstallJuvenile() {
//		return "ebook/home/bookstallJuvenile";
//	}
//	
//	@RequestMapping(value="/ebook/pageBookstallElementary.do")
//	public String pageBookstallElementary() {
//		return "ebook/home/bookstallElementary";
//	}
//	
//	@RequestMapping(value="/ebook/pageBookstallMiddle.do")
//	public String pageBookstallMiddle() {
//		return "ebook/home/bookstallMiddle";
//	}
//	
//	@RequestMapping(value="/ebook/pageBookstallNotes.do")
//	public String pageBookstallNotes() {
//		return "ebook/home/bookstallNotes";
//	}
//	
//	@RequestMapping(value="/ebook/pageBookstallSearch.do")
//	public String pageBookstallSearch() {
//		return "ebook/home/bookstallSearch";
//	}
//	
//	@RequestMapping(value="/ebook/pageShoppingBasket.do")
//	public String pageShoppingBasket() {
//		return "ebook/home/shoppingBasket";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookDetail.do")
//	public String pageEbookDetail() {
//		return "ebook/home/ebookDetail";
//	}
//	
//	@RequestMapping(value="/ebook/openEbookWizard.do")
//	public String openEbookReader() {
//		return "ebook/wizard/ebookWizard";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookReader.do")
//	public String pageEbookReader() {
//		return "ebook/wizard/ebookReader";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookReport.do")
//	public String pageEbookReport() {
//		return "ebook/wizard/ebookReport";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookPlanner.do")
//	public String pageEbookPlanner() {
//		return "ebook/wizard/ebookPlanner";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookClub.do")
//	public String pageEbookClub() {
//		return "ebook/wizard/ebookClub";
//	}
//	
//	@RequestMapping(value="/ebook/pageEbookPublisher.do")
//	public String pageEbookPublisher() {
//		return "ebook/wizard/ebookPublisher";
//	}
	
	
}
