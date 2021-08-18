package com.rar.khbook.serviceboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.serviceboard.model.service.NoticeBoardWriteService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ServiceboardController {

	@Autowired
	private NoticeBoardWriteService service;
	
	
	@RequestMapping("/ServiceboardController/insertNoticeBoard.do")
	private String insertNotice() {

		return "servicecenter/insertNoticeBoard";
	}
	@RequestMapping("/ServiceboardController/deleteNoticeBoard.do")
	private String deleteNoticeBoard(int noticeboardNo) {
		System.out.println("공지 삭제전 게시물 넘버 번호 : "+noticeboardNo);
		int result = service.deleteNoticeBoard(noticeboardNo);
		if(result>0) {
			System.out.println("deleteNoticeBoard는 1이어야해 : "+result);
		}else {
			System.out.println("deleteNoticeBoard 실패ㅐㅐㅐㅐ : "+result);
		}
		
		return "servicecenter/msg2";
	}
	@RequestMapping("/ServiceboardController/noticeBoardWrite.do")
	public ModelAndView noticeBoardWrite(String noticeTitle, String noticeContent, String memberId, ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("noticeContent", noticeContent);
		map.put("noticeTitle", noticeTitle);
		
		System.out.println("넘어오는 자료 : "+map);
		
		int result = service.noticeBoardWrite(map);
		
		if(result>0) {
			System.out.println("공지사항 작성 성공입니다.");
			
		}else {
			System.out.println("공지사항 작성 실패입니다.");
		}
		
		mv.setViewName("servicecenter/msg");
		
		return mv;
	}
	
//	이벤트게시판
	
	@RequestMapping("/ServiceboardController/insertEventBoard.do")
	private String insertEvent() {

		return "servicecenter/insertEventBoard";
	}
	@RequestMapping("/ServiceboardController/deleteEventBoard.do")
	private String deleteEventBoard(int eventboardNo) {
		System.out.println("공지 삭제전 게시물 넘버 번호 : "+eventboardNo);
		int result = service.deleteEventBoard(eventboardNo);
		if(result>0) {
			System.out.println("deleteNoticeBoard는 1이어야해 : "+result);
		}else {
			System.out.println("deleteNoticeBoard 실패ㅐㅐㅐㅐ : "+result);
		}
		
		return "servicecenter/msg2";
	}
	@RequestMapping("/ServiceboardController/eventBoardWrite.do")
	@ResponseBody
	public ModelAndView eventBoardWrite(String eventTitle, String eventContent, String memberId, ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("eventContent", eventContent);
		map.put("eventTitle", eventTitle);
		
		System.out.println("넘어오는 자료 : "+map);
		
		int result = service.eventBoardWrite(map);
		
		if(result>0) {
			System.out.println("이벤트 작성 성공입니다.");
			
		}else {
			System.out.println("이벤트 작성 실패입니다.");
		}
		
		mv.setViewName("servicecenter/msg");
		
		return mv;
	}
	
	
}
