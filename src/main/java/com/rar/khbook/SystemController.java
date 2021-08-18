package com.rar.khbook;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.servicecenter.model.service.ServiceCenterService;

@Controller
public class SystemController {
	
	@Autowired
	private ServiceCenterService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
			System.out.println("보드리스트 가져오는 컨트롤러 실행");
			List<NoticeBoard> nb= service.searchNoticeBoardList();
			System.out.println("보드리스트 받아온 결과물 : "+nb);
			if(nb != null) {
				System.out.println("보드리스트가져오기 성공!");
			}else {
				System.out.println("보드리스트가져오기 실패패패패!");
			}
			mv.addObject("notice",nb);
			mv.setViewName("index");
			return mv;
		}

		
	
	@RequestMapping("/msg.do")
	public String msg() {
		return "common/msg";
	}
	
}
