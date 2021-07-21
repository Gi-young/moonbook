package com.rar.khbook.ebook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EbookController {

	@Autowired
	EbookService service;
	
	@RequestMapping(value="/ebook/pageEbook.do")
	public String pageEbook() {
		return "ebook/ebookHome";
	}
	
	@RequestMapping(value="/ebook/openEbookReader.do")
	public ModelAndView openEbookReader(HttpSession session,ModelAndView mv) {
		//Member loginMember=(Member)session.getAttribute("loginMember");
		//String memberId=loginMember.getMemberId();
		
		//List<Ebook> ebookList=service.getEbookList(memberId);
		
		//mv.addObject("loginMember",loginMember);
		//mv.addObject("ebookList",ebookList);
		
		mv.setViewName("ebook/ebookReader");
		
		return mv;
	}
	
	@RequestMapping(value="/ebook/readBook.do")
	public ModelAndView readBook(ModelAndView mv) {
		mv.setViewName("ebook/readBook");
		return mv;
	}
	
}
