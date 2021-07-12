package com.rar.khbook.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping("/member/login.do")
	public String loginPage() {
		return "member/login";
	}
	@RequestMapping("/member/enrollPage.do")
	public String enrollPage() {
		return "member/enrollPage";
	}
	@RequestMapping("/member/enrollUser.do")
	public String enrollUser() {
		return "member/enrollPage";
	}
	
}
