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
		int result = service.deleteNoticeBoard(noticeboardNo);
		
		return "servicecenter/msg2";
	}
	@RequestMapping("/ServiceboardController/noticeBoardWrite.do")
	public ModelAndView noticeBoardWrite(String noticeTitle, String noticeContent, String memberId, ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("noticeContent", noticeContent);
		map.put("noticeTitle", noticeTitle);
		
		
		int result = service.noticeBoardWrite(map);
		
		
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
		int result = service.deleteEventBoard(eventboardNo);
		
		return "servicecenter/msg2";
	}
	@RequestMapping("/ServiceboardController/eventBoardWrite.do")
	@ResponseBody
	public ModelAndView eventBoardWrite(String eventTitle, String eventContent, String memberId, ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("eventContent", eventContent);
		map.put("eventTitle", eventTitle);
		
		
		int result = service.eventBoardWrite(map);
		
		
		mv.setViewName("servicecenter/msg");
		
		return mv;
	}
	
	
}
