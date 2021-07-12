package com.rar.khbook.ebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rar.khbook.ebook.model.service.EbookService;

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
	
}
