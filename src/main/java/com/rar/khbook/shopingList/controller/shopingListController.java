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
	public ModelAndView shopingList(Map param, ModelAndView mv) {
		
		
		mv.addObject("shopingList",service.insertShopingList(param));
		
		return mv;
		
	}
}

