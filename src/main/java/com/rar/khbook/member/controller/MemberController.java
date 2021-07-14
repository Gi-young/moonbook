package com.rar.khbook.member.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private SqlSession session;
	
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
	
	@RequestMapping("/member/myroom.do")
	public String myroom() {
		int result = session.selectOne("member.select");
		System.out.println(result);
		return "myroom/main";
	}
}
