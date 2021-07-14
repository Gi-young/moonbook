package com.rar.khbook.member.controller;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.member.model.service.MemberService;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/loginPage.do")
	public String loginPage() {
		return "member/login";
	}
	@RequestMapping("/member/login.do")
	public ModelAndView login(ModelAndView mv) {
		//이제 로그인 적어야 할 곳
		return mv;
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
	public String memberEnrollEnd(Member m,Model model) {
//		int result=session.selectOne("member.select");
//		System.out.println(result);
//		log.debug("암호화전 : {}", m.getMemberPw());
//		log.debug("암호화 후 : {}", pwEncoder.encode(m.getMemberPw()));
//		m.setMemberPw(pwEncoder.encode(m.getMemberPw()));
//		
//		int result=service.insertMember(m);
//		String msg="";
//		String loc="";
//		
//		if(result>0) {
//			msg="회원가입성공";
//			loc="/";
//			session.setAttribute("flag", true);
//		}else {
//			msg="회원가입실패";
//			loc="/member/enrollUser2.do";
//		}
//		
//		model.addAttribute("msg",msg);
//		model.addAttribute("loc",loc);
		return "common/msg";
		
	}
	
	
	
	@RequestMapping("/member/myroom.do")
	public String myroom() {
//		int result = session.selectOne("member.select");
//		System.out.println(result);
		return "myroom/main";
	}
}
