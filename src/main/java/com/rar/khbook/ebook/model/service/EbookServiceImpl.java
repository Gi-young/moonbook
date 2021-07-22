package com.rar.khbook.ebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rar.khbook.ebook.model.dao.EbookDao;

@Service
public class EbookServiceImpl implements EbookService {

	@Autowired
	private EbookDao dao;
	
}
