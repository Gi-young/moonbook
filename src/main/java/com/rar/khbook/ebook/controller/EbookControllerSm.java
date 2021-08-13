package com.rar.khbook.ebook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.ebook.model.service.EbookServiceSm;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

@Controller
public class EbookControllerSm {

	@Autowired
	EbookServiceSm service;

//	이북 메인 페이지 연결
	@RequestMapping("/ebook/ebookHome.do")
	public String ebookHome(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "48") int numPerpage, Model m) {

		/*
		 * Map param = new HashMap(); param.put("keyword", ""); param.put("searchType",
		 * "title"); param.put("categoryCode", "100020020"); param.put("pubdateOrder",
		 * "DESC"); param.put("salesOrder", "DESC"); param.put("priceOrder", "DESC");
		 * param.put("ratingOrder", "DESC"); param.put("importancePubdate", "1");
		 * param.put("importanceSales", "2"); param.put("importanceRating", "3");
		 * param.put("importancePrice", "4"); param.put("dataVolume", 100);
		 */
		int totalData = service.bookCount();
		String pageBar = new PageFactory().getOwnPageBar(totalData, cPage, numPerpage, "ebookHome.do");
		List<EbookDatabind> list = service.selectAllBook(cPage, numPerpage);
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);

		return "ebook/home/ebookHome";
	}

//	이북 조건 검색
	@RequestMapping(value = "/ebook/searchBook.do")
	public String search(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "48") int numPerpage, @RequestParam Map param, Model m, HttpServletRequest request) {

		int totalData = service.searchBookCount(param);
		String pageBar = "";
		if (param.get("dataVolume") != null) {
			if (!param.get("dataVolume").equals("")) {
				int dataVolume = Integer.parseInt((String) param.get("dataVolume"));
				pageBar = new PageFactory().searchPageBar(totalData, cPage, dataVolume, request.getContextPath()+"/ebook/searchBook.do", param);
			} else {
				pageBar = new PageFactory().searchPageBar(totalData, cPage, numPerpage, request.getContextPath()+"/ebook/searchBook.do", param);
			}
		} else {
			pageBar = new PageFactory().searchPageBar(totalData, cPage, numPerpage, request.getContextPath()+"/ebook/searchBook.do", param);
		}
		System.out.println("search.do : " + param);
		List<EbookDatabind> list = service.searchBook(param, cPage, numPerpage);
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);

		return "ebook/home/ebookHome";
	}
	
//	구매한 이북인지 확인
	@RequestMapping("/EbookControllerSm/checkEbook.do")
	@ResponseBody
	public int checkEbook(String bindNo, @SessionAttribute("loginMember") Member m) {
		
		Map param = new HashMap();
		param.put("bindNo", Integer.parseInt(bindNo));
		param.put("memberId", m.getMemberId());
		EbookDatabind eb= service.checkEbook(param);
		System.out.println(bindNo+eb+m.getMemberId());
		int result = 0;
		if(eb != null) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}
//	이북 바로 구매
	@RequestMapping("/EbookControllerSm/bookpayment.do")
	public String bookpayment(EbookDatabind b, Model m) {

		EbookDatabind eb = service.selectBook(b);
		m.addAttribute("book", eb);
		m.addAttribute("shopinglistCate", "E");
		m.addAttribute("sellStock", 1);
		
		return "sellpart/bookpayment/bookPayment";
	}
	
//	주문 및 결제
	@RequestMapping("/EbookControllerSm/orderOne.do")
	@ResponseBody()
	public String orderOne(@RequestParam Map param, @SessionAttribute("loginMember")Member m) {
		System.out.println(param);
		System.out.println(m);
		param.put("orderPoint", Math.round((Integer.parseInt((String)param.get("paidAmount"))*0.1)));
		int result = service.orderOne(param);
		
		return ""+result;
	}
	
//	장바구니 이동
	@RequestMapping("/EbookControllerSm/shopinglist.do")
	public String shopinglist(EbookDatabind b, Model m) {
		
		EbookDatabind eb = service.selectBook(b);
		m.addAttribute("eBook", eb);
		m.addAttribute("shopinglistCate", "E");
		m.addAttribute("sellStock", 1);
		
		return "shopingList/shopingList";
	}
}
