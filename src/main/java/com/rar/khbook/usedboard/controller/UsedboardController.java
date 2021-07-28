package com.rar.khbook.usedboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.usedboard.model.service.UsedboardService;
import com.rar.khbook.usedboard.model.vo.Usedcomment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsedboardController {
	
	@Autowired
	private UsedboardService service;

	@RequestMapping("/usedboard/usedboardList.do")
	public ModelAndView usedboardPage(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5") int numPerpage,
			ModelAndView mv,HttpServletRequest request) {
		String catagory=request.getParameter("catagory");
		if(catagory==null) {
		
			mv.addObject("list",service.selectUsedboardList(cPage,numPerpage));
			int totalData=service.selectUsedboardCount();
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "usedboardList.do"));
			
			mv.setViewName("usedboard/usedboardList");
		}else {
			mv.addObject("list",service.searchUsedboardList(cPage,numPerpage,catagory));
			int totalData=service.searchUsedboardCount(catagory);
			mv.addObject("totalContents",totalData);
			mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage,"usedboardList.do"));
			
			mv.setViewName("usedboard/usedboardList");
		}
		return mv;
		
	}
	
	@RequestMapping("/usedboard/usedboardView.do")
	public ModelAndView usedboardView(int no, ModelAndView mv) {
		mv.addObject("usedboard",service.selectUsedboardOne(no));
		mv.addObject("reply",service.selectReply(no));
		mv.addObject("replycount",service.selectReplyCount(no));
		mv.addObject("no",no);
		mv.setViewName("usedboard/usedboardView");
		return mv;
	}
	
	@RequestMapping("/usedboard/insertUsedcomment.do")
	public ModelAndView insertUsedcomment(Usedcomment c,ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedbaord_No"));
		mv.addObject("usedboard",service.selectUsedboardOne(no));
		mv.addObject("reply",service.selectReply(no));
		mv.addObject("replycount",service.selectReplyCount(no));
		int result=service.insertUsedcomment(c);
		if(result==1) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
		
		mv.addObject("no",no);
		mv.setViewName("usedboard/usedboardView");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardInsert.do")
	public String usedboardInsert() {
		return "/usedboard/usedboardInsert";
	}
}
