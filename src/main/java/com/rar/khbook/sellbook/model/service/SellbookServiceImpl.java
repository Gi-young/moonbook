package com.rar.khbook.sellbook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.ebook.model.dao.EbookDao;
import com.rar.khbook.sellbook.model.dao.SellbookDao;

@Service
public class SellbookServiceImpl implements SellbookService {

	@Autowired
	private SellbookDao dao;
	
}
