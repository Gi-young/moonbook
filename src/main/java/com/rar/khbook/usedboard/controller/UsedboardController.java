package com.rar.khbook.usedboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.usedboard.model.service.UsedboardService;
import com.rar.khbook.usedboard.model.vo.Usedboard;
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
		int result=service.insertUsedcomment(c);
		String msg="";
		if(result==1) {
			msg="등록성공";
		}else {
			msg="등록실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/deleteUsedcomment.do")
	public ModelAndView deleteUsedcomment(ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedbaord_No"));
		int commentNo=Integer.parseInt(req.getParameter("usedcomment_No"));
		int result=service.deleteUsedcomment(commentNo);
		int result2=service.deleteUsedcommentRef(commentNo);
		String msg="";
		if(result==1) {
			msg="삭제성공";
		}else {
			msg="삭제실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardUpdate.do")
	public ModelAndView usedboardUpdate(int no,Usedboard b, ModelAndView mv) {
		mv.addObject("usedboard",service.selectUsedboardOne(no));
		mv.addObject("no",no);
		mv.setViewName("usedboard/usedboardUpdate");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardUpdateEnd.do")
	public ModelAndView usedboardUpdateEnd(Usedboard b,ModelAndView mv,HttpServletRequest req) {
		int no=Integer.parseInt(req.getParameter("usedboard_No"));
		String msg="";
		int result=service.usedboardUpdateEnd(b);
		if(result==1) {
			msg="변경성공";
		}else {
			msg="변경실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/usedboard/usedboardView.do?no="+no);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/usedboard/usedboardInsert.do")
	public String usedboardInsert() {
		return "/usedboard/usedboardInsert";
	}
}
