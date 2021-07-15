package com.rar.khbook.member.controller;


import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;
import com.rar.khbook.member.model.service.MemberService;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/loginPage.do")
	public String loginPage() {
		return "member/login";
	}@RequestMapping("/member/login.do")
	public String login() {
		//로그인할 내용
		return "";
	}
	
	@RequestMapping("/member/enrollPage.do")
	public String enrollPage() {
		return "member/enrollPage";
	}
	@RequestMapping("/member/enrollUser.do")
	public String enrollUser() {
		return "member/enrollUser";
	}
	@RequestMapping("/member/enrollUser2.do")
	public String enrollUser2() {
		return "member/enrollUser2";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m,Model model,HttpSession sessiona) {
		
		
		log.debug("암호화전 : {}", m.getMemberPw());
		log.debug("암호화 후 : {}", pwEncoder.encode(m.getMemberPw()));
		m.setMemberPw(pwEncoder.encode(m.getMemberPw()));
		
		System.out.println("testtest : "+m.getMemberBirth());
		
		int result=service.insertMember(m);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="회원가입성공";
			loc="/";
			sessiona.setAttribute("flag", true);
		}else {
			msg="회원가입실패";
			loc="/member/enrollUser2.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
	}
	@RequestMapping("/member/checkId.do")
	public void checkId(@RequestParam Map param,Writer out) {
		System.out.println(param);
		Member m=service.selectOneMember(param);
		System.out.println("testtest : "+m);
		new Gson().toJson(m==null? "true":"false",out);
	}
	
}
