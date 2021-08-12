package com.rar.khbook.shopingList.controller;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.shopingList.model.service.ShopingListService;

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
		
		return mv;
		
	}
	
	
	
	@RequestMapping("/test")
	public String test() {
		return "shopingList/shopingList";
	}
	
}

