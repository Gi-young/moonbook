package com.rar.khbook.member.controller;


import java.io.Writer;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.rar.khbook.member.model.service.MemberService;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/member/loginPage.do")
	public String loginPage() {
		return "member/login";
	}@RequestMapping("/member/login.do")
	public String login(@RequestParam Map param,Model model,HttpSession session,HttpServletResponse res) {
		
		
		String saveId=(String)param.get("saveId");
		String memberId=(String)param.get("memberId");
		if(saveId !=null) {
			Cookie c= new Cookie("saveId",memberId);
			c.setMaxAge(7*24*60*60);
			res.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId","");
			c.setMaxAge(0);
			res.addCookie(c);
		}
		
		Member m=service.selectOneMember(param);
		System.out.println(m);
		String msg="";
		if(m!=null) {
			
			if(pwEncoder.matches((String)param.get("memberPw"), m.getMemberPw())) {
				session.setAttribute("loginMember", m);
				msg="로그인 성공";
				model.addAttribute("loc", "/");
			}else {
				msg="로그인 실패";
				model.addAttribute("loc", "/member/loginPage.do");
			}
		}else {
			msg="로그인 실패";
		}
		
		model.addAttribute("msg",msg);
		
		return "common/msg";
	}
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus ss) {
		
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
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
	public String memberEnrollEnd(Member m,Model model,HttpSession session) {
		
		
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
			session.setAttribute("flag", true);
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
	
	@RequestMapping("/member/searchIdPwPage.do")
	public String searchIdPwPage() {
		return "member/searchIdPwPage";
	}
	@RequestMapping("/member/searchIdPwPage2.do")
	public String searchIdpage2() {
		return "member/searchIdPage";
	}
	@RequestMapping("/member/searchId.do")
	public String searchId1(String memberName,String memberPhone,Member m,Model model) {
		
		m.getMemberName();
		m.getMemberPhone();
		System.out.println(m);
		Member m2=service.searchId1(m);
		
		String msg="";
		String loc="";

		if(m2==null) {
			msg="해당하는 데이터가 없습니다.";
			loc="/member/searchIdPwPage.do";
		}else {
			msg="검색완료";
			loc="/member/resultIdPage.do?m2="+m2.getMemberId();
		}
		model.addAttribute("m2", m2);
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
	@RequestMapping("/member/searchId2.do")
	public String searchId2(String memberName,String memberEmail,Model model,Member m) {
		
		m.getMemberName();
		m.getMemberEmail();
		
		Member m2=service.searchId2(m);
		
		String msg="";
		String loc="";
		System.out.println(m2);
		if(m2==null) {
			msg="해당하는 데이터가 없습니다.";
			loc="/member/searchIdPwPage.do";
		}else {
			msg="검색완료";
			loc="/member/resultIdPage.do?m2="+m2.getMemberId();
		}
		model.addAttribute("m2", m2);
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc",loc);
		
		
		return "common/msg";
	}
	@RequestMapping("/member/resultIdPage.do")
	public String resultIdPage(String m2,Model model) {
		
		model.addAttribute("m2", m2);
		
		
		return "member/resultIdPage";
	}
}
