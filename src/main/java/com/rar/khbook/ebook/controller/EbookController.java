package com.rar.khbook.ebook.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
	
	@RequestMapping(value="/ebook/openEbookReader.do")
	public ModelAndView openEbookReader(HttpSession session,ModelAndView mv) {
		mv.setViewName("ebook/ebookReader");
		
		return mv;
	}
	
	@RequestMapping(value="/ebook/readBook.do")
	public ModelAndView readBook(ModelAndView mv) {
		mv.setViewName("ebook/readBook");
		return mv;
	}
	
	@RequestMapping(value = "/ebook/getEBooksFromAPI.do", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getEBooksFromAPI(@RequestParam(value = "postParams", required = false) String postParams) {
		String clientId = "M3sMrvNy4wHO2sKgHMae";
		String clientSecret = "5QxKP7UbYJ";
		StringBuffer response=new StringBuffer();
		try {
			String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?"
					+ "display=" + 20
					+ "&d_titl=" + URLEncoder.encode("가", "UTF-8")
					+ "&d_catg=" + URLEncoder.encode("300050", "UTF-8");
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con.setDoOutput(false);
			
			BufferedReader br;
			int responseCode = con.getResponseCode();
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return response.toString();
	}
	
}
