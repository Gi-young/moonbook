package com.rar.khbook.servicecenter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService service;
	
	@RequestMapping("/service/serviceMain.do")
	public ModelAndView servicePage(ModelAndView mv) {
		System.out.println("보드리스트 가져오는 컨트롤러 실행");
		List<NoticeBoard> nb= service.searchNoticeBoardList();
		System.out.println("보드리스트 받아온 결과물 : "+nb);
		if(nb != null) {
			System.out.println("보드리스트가져오기 성공!");
		}else {
			System.out.println("보드리스트가져오기 실패패패패!");
		}
		mv.addObject("notice",nb);
		mv.setViewName("servicecenter/serviceMain");
		return mv;
	}

	@RequestMapping("/service/eventBoard.do")
	public ModelAndView eventPage(ModelAndView mv) {
			System.out.println("이벤트리스트 가져오는 컨트롤러 실행");
			List<EventBoard> ev= service.searchEventBoardList();
			System.out.println("이벤트리스트 받아온 결과물 : "+ev);
			if(ev != null) {
				System.out.println("이벤트리스트가져오기 성공!");
			}else {
				System.out.println("이벤트리스트가져오기 실패패패패!");
			}
			mv.addObject("event",ev);
			mv.setViewName("/servicecenter/eventBoard");
		return mv;
	}
	@RequestMapping("/service/faqPage.do")
	public String faqPage() {
		return "servicecenter/faqPage";
	}


}
