package com.rar.khbook.usedboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UsedboardController {

	@RequestMapping("/usedboard/usedboardPage.do")
	public String usedboardPage() {
		return "/usedboard/usedboardList";
	}
}
