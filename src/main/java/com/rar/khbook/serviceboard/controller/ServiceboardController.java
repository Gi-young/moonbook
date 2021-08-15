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
		
		return "service/serviceMain.do";
	}
	@RequestMapping("/ServiceboardController/noticeBoardWrite.do")
	@ResponseBody
	public ModelAndView noticeBoardWrite(String noticeTitle, String noticeContent, String memberId, ModelAndView mv) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("noticeContent", noticeContent);
		map.put("noticeTitle", noticeTitle);
		
		System.out.println("넘어오는 자료다 맨이야 : "+map);
		
		int result = service.noticeBoardWrite(map);
		
		if(result>0) {
			System.out.println("공지사항 작성 성공입니다.");
			
		}else {
			System.out.println("공지사항 작성 실패입니다.");
		}
		
		mv.setViewName("service/serviceMain.do");
		
		return mv;
	}
	
	
	
	/*
	 * @RequestMapping("/SellbookController/insertNoticeBoard.do") public
	 * ModelAndView insertNotice(ModelAndView mv) { SellbookDatabind b =
	 * service.bookOne(bindNo); mv.addObject("b", b); mv.addObject("bindNo",
	 * bindNo); mv.setViewName("sellpart/insertReviewBook"); return mv; }
	 * 
	 * @RequestMapping("/SellbookController/productReview.do")
	 * 
	 * @ResponseBody public List<BookBoard> review(@RequestParam Map param, Model m)
	 * { System.out.println("param 이다 이게바로 : "+param); List<BookBoard> bb =
	 * service.selectReview(param); System.out.println("bb다 이게바로 : "+bb); return bb;
	 * }
	 * 
	 * @RequestMapping("/SellbookController/productReview2.do")
	 * 
	 * @ResponseBody public String reviewPageBar(int bindNo, ModelAndView mv,
	 * 
	 * @RequestParam(value = "cPage", defaultValue = "1") int cPage,
	 * 
	 * @RequestParam(value = "nunPerpage", defaultValue = "10") int numPerpage) {
	 * 
	 * int totalData = service.selectReviewAll(bindNo);
	 * 
	 * System.out.println("totalData" + totalData);
	 * 
	 * String getOwnPageBar = PageFactory.getWonJaePageBar(totalData, cPage,
	 * numPerpage); System.out.println(getOwnPageBar); return getOwnPageBar; } //
	 * insertReview.jsp 에서 넘어오는 폼 값을 받는 컨트롤러
	 * 
	 * @RequestMapping("/SellbookController/reviewWrite.do") public ModelAndView
	 * reviewWrite(int bindNo, ModelAndView mv, String content, MultipartFile file,
	 * int score, String loginMember) { System.out.println("리뷰 작성하기 위해 넘어가는 : " +
	 * bindNo); System.out.println("리뷰 작성하기 위해 넘어가는 : " + content);
	 * System.out.println("리뷰 작성하기 위해 넘어가는 : " + file);
	 * System.out.println("리뷰 작성하기 위해 넘어가는 : " + score);
	 * System.out.println("리뷰 작성하기 위해 넘어가는 : " + loginMember);
	 * 
	 * HashMap<String, Object> map = new HashMap<>();
	 * 
	 * map.put("bindNo", bindNo); map.put("content", content); map.put("img", file);
	 * map.put("score", score); map.put("memberId", loginMember);
	 * 
	 * int result = service.reviewWrite(map);
	 * 
	 * 
	 * mv.addObject("msg", ); mv.addObject("loc", ); mv.setViewName("");
	 * 
	 * 
	 * mv.setViewName("sellpart/bookDetail.do?bindNo="+bindNo); return mv; }
	 */
}
