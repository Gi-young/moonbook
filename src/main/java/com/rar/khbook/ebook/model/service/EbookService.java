package com.rar.khbook.ebook.model.service;

import java.util.List;
import java.util.Map;

import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;

public interface EbookService {

	int insertBookDataIntoDatabase(Map param);
	
	List<EbookDatabind> search(Map param);

	int uploadEbook(Ebook ebook);
	
	Member login(String memberId);
	
}
