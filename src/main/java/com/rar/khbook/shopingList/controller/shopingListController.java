package com.rar.khbook.shopingList.controller;



import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

		//System.out.println("이거파람인데sdsdsd : "+param);
		mv.addObject("msg","장바구니에 등록되었습니다.");
		mv.setViewName("servicecenter/msgShopList");
		return mv;
		
	}
		
	
	@RequestMapping("/test")
	public String test() {
		return "shopingList/shopingList";
	}
	
	@RequestMapping("/shopingList/shopingListView.do")
	public ModelAndView shopingListView(String memberId, ModelAndView mv) {
		
		List<BookShopingList> bList = service.selectMyShopingListB(memberId);
		List<EbookShopingList> eList = service.selectMyShopingListE(memberId);
		List<GiftShopingList> gList = service.selectMyShopingListG(memberId);
		
		String[] arr1 = new String[bList.size()];
		String[] arr2 = new String[eList.size()];
		String[] arr3 = new String[gList.size()];
		
		for(int i=0; i<bList.size(); i++) {
			arr1[i] = String.valueOf(bList.get(i).getBindNoB());
			
		}
		for(int i=0; i<eList.size(); i++) {	
			arr2[i] = String.valueOf(eList.get(i).getBindNoE());
		}
		for(int i=0; i<gList.size(); i++) {
			arr3[i] = String.valueOf(gList.get(i).getGiftNo());
		}
		
		String str1 = (String)String.join(",",arr1);
		String str2 = (String)String.join(",",arr2);
		String str3 = (String)String.join(",",arr3);
		
		Map<String, String> param1 = new HashMap();
		Map<String, String> param2 = new HashMap();
		Map<String, String> param3 = new HashMap();
		param1.put("arr", str1);
		param2.put("arr", str2);
		param3.put("arr", str3);
		
		List<SellbookDatabind> book = service.myShopingListB(param1);
		List<EbookDatabind> eBook = service.myShopingListE(param2);
		List<Ngift> gift = service.myShopingListG(param3);
		
		mv.addObject("book", book);
		mv.addObject("eBook", eBook);
		mv.addObject("gift", gift);
		mv.addObject("bList", bList);
		mv.addObject("eList", eList);
		mv.addObject("gList", gList);
		mv.setViewName("shopingList/shopingList");
		return mv;
	}
	
	@RequestMapping("/shopingList/buyShopingList.do")
	public ModelAndView insertList(ModelAndView mv, 
			@RequestParam Map param) {
		
		int result = service.insertList(param);
		
		return mv;
	}

	@RequestMapping(value = "/shopingList/getMerchantUid.do")
	@ResponseBody
	public String getMerchantUid() {
		
		String merchantUid = "ORD-EB-";
		
		Calendar cal = Calendar.getInstance();
		
		Date today = new Date(cal.getTimeInMillis());
		
		int rndNum=(int)(Math.random()*10000);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		merchantUid += sdf.format(today) + "-" + rndNum;
		
		return merchantUid;
	}
	
	
	@RequestMapping("/shopingList/deleteBook.do")
	@ResponseBody
	public int deleteBook(@RequestParam Map param) {
		int result = service.deleteBook(param);
		
		return result;
	}
	
	@RequestMapping("/shopingList/deleteEbook.do")
	@ResponseBody
	public int deleteEbook(@RequestParam Map param) {
		int result = service.deleteEbook(param);
		
		return result;
	}
	
	@RequestMapping("/shopingList/deleteGift.do")
	@ResponseBody
	public int deleteGift(@RequestParam Map param) {
		int result = service.deleteGift(param);
		
		return result;
	}
	
	
	@RequestMapping("/shopingList/writePurchaseLog.do")
	@ResponseBody
	public int writePurchaseLog(@RequestParam Map param) {
		int result = service.writePurchaseLog(param);
		System.out.println(result);
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
		
	}
	
	
	@RequestMapping("/shopingList/salesVolumeAdd.do")
	@ResponseBody
	public int salesVolumeAdd(@RequestParam Map param) {
		System.out.println("여기 들어옴??");
		System.out.println("장바구니 결제 로직 마지막 메소드로 넘어오는 파람: "+param);
		
		int result = service.salesVolumeAdd(param);
		
		return result;
	}
	
	
	
}

