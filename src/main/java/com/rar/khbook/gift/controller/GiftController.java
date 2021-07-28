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
}
