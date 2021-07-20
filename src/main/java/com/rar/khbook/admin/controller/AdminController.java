package com.rar.khbook.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.admin.model.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	

}
