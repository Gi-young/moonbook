package com.rar.khbook.gift.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GiftController {
	
//	기프트 메인페이지 이동
	@RequestMapping("/gift/giftView.do")
	public String giftView() {
		return "gift/gift";
	}
	
//	기프트 상세페이지 이동
	@RequestMapping("/gift/giftDetail.do")
	public String giftDetail(int giftNo) {
		
		return "gift/giftDetail";
	}
	
// 	내 쿠폰 페이지 
	@RequestMapping("/gift/myCoupon.do")
	public String myCoupons() {
		return "gift/myCoupon";
	}
}
