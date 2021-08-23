package com.rar.khbook;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.gift.model.service.GiftService;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.serviceboard.model.vo.EventBoard;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.servicecenter.model.service.ServiceCenterService;

@Controller
public class SystemController {
	
	@Autowired
	private ServiceCenterService service;
	
	@Autowired
	private GiftService service2;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
			List<NoticeBoard> nb= service.searchNoticeBoardList();
			List<EventBoard> eb= service.searchEventBoardList();
			List<Ngift> ng = service2.giftAll();
			
			mv.addObject("gift",ng);
			mv.addObject("notice",nb);
			mv.addObject("event",eb);
			mv.setViewName("index");
			return mv;
		}

		
	
	@RequestMapping("/msg.do")
	public String msg() {
		return "common/msg";
	}
	
}
