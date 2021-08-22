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

		System.out.println("이거파람인데 : "+param);
		mv.addObject("shopingList",service.insertShopingList(param));

		System.out.println("이거파람인데sdsdsd : "+param);
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
//		System.out.println("장바구니 param : "+memberId);
		
//		List<Integer> paramB = new ArrayList();// 상품번호 담는 리스트
//		List<Integer> paramE = new ArrayList();// 얘도 황도
//		List<Integer> paramG = new ArrayList();// ? 얘도?
		
		List<BookShopingList> bList = service.selectMyShopingListB(memberId);
		//System.out.println("bList 뽑아옴 "+bList.get(0).getBindNoB());
		List<EbookShopingList> eList = service.selectMyShopingListE(memberId);
		//System.out.println("eList 뽑아옴 "+eList.get(0).getBindNoE());
		List<GiftShopingList> gList = service.selectMyShopingListG(memberId);
		//System.out.println("gList 뽑아옴 "+gList.get(0).getGiftNo());
		
		String[] arr1 = new String[bList.size()];
		String[] arr2 = new String[eList.size()];
		String[] arr3 = new String[gList.size()];
		
		for(int i=0; i<bList.size(); i++) {
			arr1[i] = String.valueOf(bList.get(i).getBindNoB());
			//paramB.add(bList.get(i).getShopingListCount());
			//paramB.add(bList.get(i).getBindNoB());		
//			System.out.println(arr1[i]);
//			System.out.println(bList.get(i).getBindNoB());
//			System.out.println(bList.get(i).getShopingListCount());
			
		}
//		System.out.println(paramB);
		for(int i=0; i<eList.size(); i++) {	
			arr2[i] = String.valueOf(eList.get(i).getBindNoE());
			//paramE.add(eList.get(i).getShopingListCount());
			//paramE.add(eList.get(i).getBindNoE());
//			System.out.println(arr2[i]);
//			System.out.println(eList.get(i).getBindNoE());
//			System.out.println(eList.get(i).getShopingListCount());
		}
//		System.out.println(paramB);
		for(int i=0; i<gList.size(); i++) {
			arr3[i] = String.valueOf(gList.get(i).getGiftNo());
			//paramG.add(gList.get(i).getShopingListCount());
			//paramG.add(gList.get(i).getGiftNo());
//			System.out.println(arr3[i]);
//			System.out.println(gList.get(i).getGiftNo());
//			System.out.println(gList.get(i).getShopingListCount());
		}
//		System.out.println(paramB);
	
		
//		System.out.println("test : " +String.join(",",arr1));
//		System.out.println("test : " +String.join(",",arr2));
//		System.out.println("test : " +String.join(",",arr3));
		
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
		
//		mv.addObject(paramB);
//		mv.addObject(paramE);
//		mv.addObject(paramG);
		mv.addObject("book", book);
//		System.out.println("book ::::::"+book );
		mv.addObject("eBook", eBook);
//		System.out.println("ebook ::::::"+eBook );
		mv.addObject("gift", gift);
//		System.out.println("gift ::::::"+gift );
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
	
	@RequestMapping("/shopingList/writePurchaseLog.do")
	@ResponseBody
	public int writePurchaseLog(@RequestParam Map param) {
			
		int resultF = service.writeOrderT(param);
		
		if(resultF>0) {
//			int result = service.writePurchaseLog(param);		
//			return result;
		}else {
			return 0;
		}
		return 1;
	}
	
}

