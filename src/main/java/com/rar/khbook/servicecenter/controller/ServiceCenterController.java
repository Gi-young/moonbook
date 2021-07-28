package com.rar.khbook.servicecenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService service;
	
	@RequestMapping("/service/servicePage.do")
	public String servicePage() {
		
		return "servicecenter/serviceMain";
	}
	@RequestMapping("/service/noticePage.do")
	public String noticePage() {
		
		return "servicecenter/noticePage";
	}
	@RequestMapping("/service/faqPage.do")
	public String faqPage() {
		return "servicecenter/faqPage";
	}
	
}
