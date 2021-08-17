package com.rar.khbook.shopingList.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.sellbook.model.vo.SellbookDatabind;
import com.rar.khbook.shopingList.model.service.ShopingListService;
import com.rar.khbook.shopingList.model.vo.BookShopingList;
import com.rar.khbook.shopingList.model.vo.EbookShopingList;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class shopingListController {

	
	@Autowired 
	private ShopingListService service;	
	
	@RequestMapping("/shopingList/shopingList.do") 
	public ModelAndView shopingList(@RequestParam Map param, ModelAndView mv) {

		//System.out.println("이거파람인데 : "+param);
		mv.addObject("shopingList",service.insertShopingList(param));
		
		return mv;
		
	}
		
	
	@RequestMapping("/test")
	public String test() {
		return "shopingList/shopingList";
	}
	
	@RequestMapping("/shopingList/shopingListView.do")
	public ModelAndView shopingListView(String memberId, ModelAndView mv) {
		System.out.println("장바구니 param : "+memberId);
		
		List paramB = new ArrayList();
		List paramE = new ArrayList();
		List paramG = new ArrayList();
		
		List<BookShopingList> bList = service.selectMyShopingListB(memberId);
		System.out.println("bList 뽑아옴 "+bList.get(0).getBindNoB());
		List<EbookShopingList> eList = service.selectMyShopingListE(memberId);
		System.out.println("eList 뽑아옴 "+eList.get(0).getBindNoE());
		List<GiftShopingList> gList = service.selectMyShopingListG(memberId);
		System.out.println("gList 뽑아옴 "+gList.get(0).getGiftNo());
		
		for(int i=0; i<bList.size(); i++) {			
			paramB.add(bList.get(i).getBindNoB());
		}
		System.out.println(paramB);
		for(int i=0; i<eList.size(); i++) {	
			paramE.add(eList.get(i).getBindNoE());
		}
		System.out.println(paramB);
		for(int i=0; i<gList.size(); i++) {
			paramG.add(gList.get(i).getGiftNo());
		}
		System.out.println(paramB);
		
		
		List<SellbookDatabind> book = service.myShopingListB(paramB);
		List<EbookDatabind> eBook = service.myShopingListE(paramE);
		List<Ngift> gift = service.myShopingListG(paramG);
		
		mv.addObject("book", book);
		mv.addObject("eBook", eBook);
		mv.addObject("gift", gift);
		mv.addObject("bList", bList);
		mv.addObject("eList", eList);
		mv.addObject("gList", gList);
		mv.setViewName("shopingList/shopingList");
		return mv;
	}
}

