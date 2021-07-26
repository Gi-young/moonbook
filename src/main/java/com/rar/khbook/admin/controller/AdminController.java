package com.rar.khbook.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.admin.model.service.AdminService;
import com.rar.khbook.common.PageFactory;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	@RequestMapping("/admin/adMemberPage.do")
	public ModelAndView adUpdateMember(
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="5") int numPerpage,ModelAndView mv) {
		
		mv.addObject("list",service.selectMemberList(cPage,numPerpage));
		
		int totalData=service.selectMemberCount();
		
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage,5, "adMemberPage.do"));
		
		mv.setViewName("admin/adminMemberPage");
		
		return mv;
	}
	
	

}
