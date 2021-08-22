package com.rar.khbook.ebook.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.ebook.model.vo.Ebook;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.member.model.vo.Member;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"loginMember"})
public class EbookController {

	@Autowired
	EbookService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping(value="/ebook/pageEbook.do")
	public String pageEbook(@RequestParam(required=false) String currentFocus,
			@RequestParam(value="ebookDetailLoginCheck", required=false) String ebookDetailLoginCheck,
			Model model) {
		
		model.addAttribute("currentFocus", currentFocus);
		
		model.addAttribute("ebookDetailLoginCheck", ebookDetailLoginCheck);
		
		return "ebook/home/ebookHome";
		
	}
	
	@RequestMapping(value="/ebook/pageShoppingBasket.do")
	public String pageShoppingBasket() {
		return "ebook/home/shoppingBasket";
	}
	
	@RequestMapping(value="/ebook/pageEbookDetail.do")
	public String pageEbookDetail(int bindNo, Model model) {
		System.out.println(bindNo);
		
		EbookDatabind ebookDatabind = service.searchOneBook(bindNo);
		
		System.out.println("컨트롤러 : " + ebookDatabind);
		
		model.addAttribute("ebookDatabind", ebookDatabind);
		
		return "ebook/home/ebookDetail";
	}
	
	@RequestMapping(value="/ebook/pageUploadEbook.do")
	public String pageUploadEbook() {
		return "ebook/home/uploadEbook";
	}
	
	@RequestMapping(value="/ebook/pageLogin.do")
	public String pageLogin() {
		return "ebook/home/login";
	}
	
	@RequestMapping(value = "/ebook/pageManageBanner.do")
	public String pageManageBanner() {
		return "ebook/home/manageBanner";
	}
	
	@RequestMapping(value="/ebook/openEbookWizard.do")
	public String openEbookReader(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginMemberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		HashMap record = service.getTodayRecord(loginMemberId);
		
		if (record == null) {
			service.insertTodayRecord(loginMemberId);
		}
		
		return "ebook/wizard/ebookWizard";
	}
	
	@RequestMapping(value="/ebook/pageEbookReader.do")
	public String pageEbookReader(String bindNo, Model model, HttpServletRequest request) {
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		String loginMemberId = loginMember.getMemberId();
		
		int lastPage = service.getLastPage(bindNo, loginMemberId);
		
		String filepath = service.getEbookFilepath(bindNo);
		
		model.addAttribute("bindNo", bindNo);
		model.addAttribute("filepath", filepath);
		model.addAttribute("lastPage", lastPage);
		
		return "ebook/wizard/ebookReader";
	}
	
	@RequestMapping(value="/ebook/pageEbookClub.do")
	public String pageEbookClubManager() {
		return "ebook/wizard/ebookClub";
	}
	
	@RequestMapping(value = "/ebook/getBookDataFromAPI.do", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getEBooksFromAPI(
			@RequestParam(value = "groupId", required = false) String groupId,
			@RequestParam(value = "keyword", required = false) String keyword
			) {
		String clientId = "M3sMrvNy4wHO2sKgHMae";
		String clientSecret = "5QxKP7UbYJ";
		StringBuffer response=new StringBuffer();
		try {
			String apiURL = "https://openapi.naver.com/v1/search/book_adv.xml?"
					+ "display=" + 20
					+ "&d_titl=" + URLEncoder.encode(keyword, "UTF-8")
					+ "&d_catg=" + URLEncoder.encode(groupId, "UTF-8");
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
	
	@RequestMapping(value = "/ebook/insertBookDataIntoDatabase.do")
	@ResponseBody
	public int insertBookDataToDatabase(@RequestParam Map param) {
		String pubdate = (String)param.get("pubdate");
		String dateStr = pubdate.substring(0,4) + "-" + pubdate.substring(4,6) + "-" + pubdate.substring(6);
		param.put("pubdate", Date.valueOf(dateStr));
		
		String title = (String)param.get("title");
		String author = (String)param.get("author");
		String description = (String)param.get("description");
		title = title.replace("<b>", "").replace("</b>", "");
		author = author.replace("<b>", "").replace("</b>", "");
		description = description.replace("<b>", "").replace("</b>", "");
		param.put("title", title);
		param.put("author", author);
		param.put("description", description);
		
		int result = service.insertBookDataIntoDatabase(param);
		return result;
	}
	
	@RequestMapping(value = "/ebook/login.do")
	public String login(@RequestParam Map param, Model model, HttpServletResponse response) {
		String memberId = (String)param.get("memberId");
		String password = (String)param.get("password");
		
		if(param.get("saveId") != null) {
			Cookie cookie = new Cookie("saveId", memberId);
			cookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		Member m = service.login(memberId);
		
		if(m != null) {
			if(pwEncoder.matches(password, m.getMemberPw())) {
				model.addAttribute("loginMember", m);
				model.addAttribute("result", "로그인 성공");
			} else {
				model.addAttribute("result", "로그인 실패");
			}
		} else {
			model.addAttribute("result", "로그인 실패");
		}
		
		return "ebook/home/login";
	}
	
	@RequestMapping(value = "/ebook/logout.do")
	public String logout(SessionStatus ss) {
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		
		return "ebook/home/ebookHome";
	}
	
	@RequestMapping(value = "/ebook/getMemberInfo.do")
	@ResponseBody
	public Member getMemberInfo(String memberId) {
		Member member = service.login(memberId);
		
		return member;
	}
	
	@RequestMapping(value = "/ebook/search.do")
	@ResponseBody
	public List<EbookDatabind> search(@RequestParam Map param) {
		
		System.out.println("search.do : " + param);
		
		List<EbookDatabind> list = service.search(param);
		
		return list;
	}
	
	@RequestMapping(value = "/ebook/uploadEbook.do")
	public String uploadEbook(int ebookNo, MultipartFile[] upFile, HttpServletRequest request, Model model) {
		System.out.println(ebookNo);
		
		Ebook ebook = null;
		
		String path = request.getServletContext().getRealPath("/resources/ebook/");
		File dir = new File(path);
		
		if(!dir.exists()) dir.mkdirs();
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String originalFilename = f.getOriginalFilename();
				String originalName = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String rename = sdf.format(System.currentTimeMillis()) + "_" + originalName + extension;
			
				try {
					f.transferTo(new File(path + rename));
					
				} catch(IOException e) {
					e.printStackTrace();
				}
				ebook = Ebook.builder().ebookNo(ebookNo).filepath(rename).build();
			}
		}
		
		int result = service.uploadEbook(ebook);
		String message = "";
		if(result > 0) {
			message = "success";
		} else {
			message = "fail";
		}
		model.addAttribute("result", result);
		model.addAttribute("message", message);
		
		return "ebook/home/uploadEbook";
	}
	
	@RequestMapping(value = "/ebook/checkLoved.do")
	@ResponseBody
	public int checkLoved(@RequestParam Map param) {
		int result = service.checkLoved(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/countLoved.do")
	@ResponseBody
	public int countLoved(@RequestParam Map param) {
		return service.countLoved(param);
	}
	
	@RequestMapping(value = "/ebook/checkShopped.do")
	@ResponseBody
	public int checkShopped(@RequestParam Map param) {
		int result = service.checkShopped(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/loveBook.do")
	@ResponseBody
	public int loveBook(@RequestParam Map param) {
		int result = service.loveBook(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/unloveBook.do")
	@ResponseBody
	public int unloveBook(@RequestParam Map param) {
		int result = service.unloveBook(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/putInShoppingBasket.do")
	@ResponseBody
	public int putInShoppingBasket(@RequestParam Map param) {
		System.out.println(param);
		
		int result = service.putInShoppingBasket(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/putOutShoppingBasket.do")
	@ResponseBody
	public int putOutShoppingBasket(@RequestParam Map param) {
		System.out.println(param);
		
		int result = service.putOutShoppingBasket(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/getMyBooksFromBasket.do")
	@ResponseBody
	public List<HashMap> getMyBooksFromBasket(String loginMemberId) {
		List<HashMap> list = service.getMyBooksFromBasket(loginMemberId);
		
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value = "/eBook/getMerchantUid.do")
	@ResponseBody
	public String getMerchantUid() {
		String merchantUid = "ORD-EB-";
		
		Calendar cal = Calendar.getInstance();
		
		Date today = new Date(cal.getTimeInMillis());
		
		int rndNum=(int)(Math.random()*10000);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		merchantUid += sdf.format(today) + "-" + rndNum;
		
		return merchantUid;
	}
	
	@RequestMapping(value = "/ebook/writePurchaseLog.do")
	@ResponseBody
	public int writePurchaseLog(@RequestParam Map param) {
		int result = service.writePurchaseLog(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/cancelPayment.do")
	@ResponseBody
	public void cancelPayment(String impUid) {
		IamportClient client = new IamportClient("4908788018841847", "0592eb6730a3152fabd2d15d1bd842c74cda7b38414a0395f5a0ca5c58b4c94ddeba9e084b02cad2");
		
		CancelData cancelData = new CancelData(impUid, true);
		
		try {
			IamportResponse<Payment> paymentResponse = client.cancelPaymentByImpUid(cancelData);
		} catch(IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
				case 401: break;
				
				case 500: break;
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/ebook/checkClubName.do")
	@ResponseBody
	public int checkClubName(String clubName) {
		int result = service.checkClubName(clubName);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/createClub.do")
	@ResponseBody
	public int createClub(@RequestParam Map param) {
		int result = service.createClub(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/showMyClubList.do")
	@ResponseBody
	public List<HashMap> showMyClubList(String memberId) {
		List<HashMap> list = service.showMyClubList(memberId);
		
		return list;
	}
	
	@RequestMapping(value = "/ebook/showClubInfo.do")
	@ResponseBody
	public List<HashMap> showClubInfo(String clubName) {
		System.out.println("컨트롤러 테스트 : " + clubName);
		
		List<HashMap> list = service.showClubInfo(clubName);
		
		return list;
	}
	
	@RequestMapping(value = "/ebook/checkAuthority.do")
	@ResponseBody
	public HashMap checkAuthority(String clubName) {
		return service.checkAuthority(clubName);
	}
	
	@RequestMapping(value = "/ebook/deleteClub.do")
	@ResponseBody
	public int deleteClub(String clubName) {
		return service.deleteClub(clubName);
	}
	
	@RequestMapping(value = "/ebook/joinClub.do")
	@ResponseBody
	public int joinClub(@RequestParam Map param) {
		return service.joinClub(param);
	}
	
	@RequestMapping(value = "/ebook/deportMember.do")
	@ResponseBody
	public int deportMember(@RequestParam Map param) {
		return service.deportMember(param);
	}
	
	@RequestMapping(value = "/ebook/saveMessage.do")
	@ResponseBody
	public int saveMessage(@RequestParam Map param) {
		return service.saveMessage(param);
	}
	
	@RequestMapping(value = "/ebook/deleteMessage.do")
	@ResponseBody
	public int deleteMessage(@RequestParam Map param) {
		return service.deleteMessage(param);
	}
	
	@RequestMapping(value = "/ebook/loadMessage.do")
	@ResponseBody
	public List<HashMap> loadMessage(String memberId) {
		return service.loadMessage(memberId);
	}
	
	@RequestMapping(value = "/ebook/getMyEbooks.do")
	@ResponseBody
	public List<HashMap> getMyEbooks(@RequestParam Map param) {
		return service.getMyEbooks(param);
	}
	
	@RequestMapping(value = "/ebook/createSort.do")
	@ResponseBody
	public int createSort(@RequestParam Map param) {
		return service.createSort(param);
	}
	
	@RequestMapping(value = "/ebook/listMySorts.do")
	@ResponseBody
	public List<String> listMySorts(String memberId) {
		return service.listMySorts(memberId);
	}
	
	@RequestMapping(value = "/ebook/changeSort.do")
	@ResponseBody
	public int changeSort(@RequestParam Map param) {
		int result = service.changeSort(param);
		
		int cleanResult = service.cleanPseudoSortRow(param);
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/deleteSort.do")
	@ResponseBody
	public int deleteSort(@RequestParam Map param) {
		int result = service.deleteSort(param);
		
		int cleanResult = service.cleanData();
		
		return result;
	}
	
	@RequestMapping(value = "/ebook/changeBookshelf.do")
	@ResponseBody
	public List<HashMap> changeBookshelf(@RequestParam Map param) {
		return service.changeBookshelf(param);
	}
	
	@RequestMapping(value = "/ebook/dataCountFromSort.do")
	@ResponseBody
	public int dataCountFromSort(@RequestParam Map param) {
		return service.dataCountFromSort(param);
	}
	
	@RequestMapping(value = "/ebook/liftFromSort.do")
	@ResponseBody
	public int liftFromSort(@RequestParam Map param) {
		return service.liftFromSort(param);
	}
	
	@RequestMapping(value = "/ebook/dataCountAll.do")
	@ResponseBody
	public int dataCountAll(@RequestParam Map param) {
		return service.dataCountAll(param);
	}
	
	@RequestMapping(value = "/ebook/loadMusic.do")
	@ResponseBody
	public List<HashMap> loadMusic() {
		return service.loadMusic();
	}
	
	@RequestMapping(value = "/ebook/setAutoplay.do")
	@ResponseBody
	public void setAutoplay(String setValue, HttpServletResponse response) {
		Cookie cookie = null;
		
		if (setValue.equals("false")) {
			cookie = new Cookie("grantAutoplay", setValue);
			cookie.setMaxAge(60 * 60 * 24 * 7);
		} else {
			cookie = new Cookie("grantAutoplay", "");
			cookie.setMaxAge(0);
		}
		
		response.addCookie(cookie);
	}
	
	@RequestMapping(value = "/ebook/countReadPage.do")
	@ResponseBody
	public int countReadPage(String loginMemberId) {
		return service.countReadPage(loginMemberId);
	}
	
	@RequestMapping(value = "/ebook/getReadPage.do")
	@ResponseBody
	public int getReadPage(String loginMemberId) {
		HashMap result = service.getTodayRecord(loginMemberId);
		
		System.out.println("getTodayRecord: " + result);
		
		return Integer.parseInt(String.valueOf(result.get("READ_PAGE")));
	}
	
	@RequestMapping(value = "/ebook/getReadTime.do")
	@ResponseBody
	public int getReadTime(String loginMemberId) {
		HashMap result = service.getTodayRecord(loginMemberId);
		
		return Integer.parseInt(String.valueOf(result.get("READ_TIME_IN_MINUTES")));
	}
	
	@RequestMapping(value = "/ebook/countReadTime.do")
	@ResponseBody
	public int countReadTime(String loginMemberId) {
		return service.countReadTime(loginMemberId);
	}
	
	@RequestMapping(value = "/ebook/getBasicBookMarks.do")
	@ResponseBody
	public List<HashMap> getBasicBookMarks(int bindNo) {
		return service.getBasicBookMarks(bindNo);
	}
	
	@RequestMapping(value = "/ebook/createCustomBookMark.do")
	@ResponseBody
	public int createCustomBookMark(@RequestParam Map param) {
		return service.createCustomBookMark(param);
	}
	
	@RequestMapping(value = "/ebook/getCustomBookmark.do")
	@ResponseBody
	public List<HashMap> getCustomBookmark(@RequestParam Map param) {
		return service.getCustomBookmark(param);
	}
	
	@RequestMapping(value = "/ebook/deleteCustomBookmark.do")
	@ResponseBody
	public int deleteCustomBookmark(@RequestParam Map param) {
		return service.deleteCustomBookmark(param);
	}
	
	@RequestMapping(value = "/ebook/lastPage.do")
	@ResponseBody
	public int lastPage(@RequestParam Map param) {
		return service.lastPage(param);
	}
	
	@RequestMapping(value = "/ebook/getBookCategory.do")
	@ResponseBody
	public List<HashMap> getBookCategory() {
		return service.getBookCategory();
	}
	
	@RequestMapping(value = "/ebook/newSearch.do")
	@ResponseBody
	public List<HashMap> newSearch(@RequestParam Map param) {
		if (param.get("cPage") == null) {
			param.put("cPage", "1");
		}
		
		if (param.get("numPerPage") == null) {
			param.put("numPerPage", "12");
		}
		
		return service.newSearch(param);
	}
	
	@RequestMapping(value = "/ebook/getPageBar.do")
	@ResponseBody
	public String getPageBar(@RequestParam Map param) {
		if (param.get("cPage") == null) {
			param.put("cPage", "1");
		}
		
		if (param.get("numPerPage") == null) {
			param.put("numPerPage", "12");
		}
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerPage = Integer.parseInt((String)param.get("numPerPage"));
		
		int totalData = service.getTotalData(param);
		
		String pageBar = EbookPageBarFactory.getPageBar(totalData, cPage, numPerPage);
		
		return pageBar;
	}
	
	@RequestMapping(value = "/ebook/getCategories.do")
	@ResponseBody
	public List<HashMap> getCategories(@RequestParam Map param) {
		String[] metaCategory = ((String)param.get("metaCategory")).split(",");
		
		System.out.println(metaCategory.length);
		System.out.println(metaCategory[0]);
		
		for (String s : metaCategory) {
			System.out.println(s.equals(""));
		}
		
		param.put("metaCategory", metaCategory);
		
		return service.getCategories(param);
	}
	
	@RequestMapping(value = "/ebook/getCategoriesForPaperBook.do")
	@ResponseBody
	public List<HashMap> getCategoriesForPaperBook(@RequestParam Map param) {
		return service.getCategoriesForPaperBook(param);
	}
	
	@RequestMapping(value = "/ebook/newSearchForPaperBook.do")
	@ResponseBody
	public List<HashMap> newSearchForPaperBook(@RequestParam Map param) {
		if (param.get("cPage") == null) {
			param.put("cPage", "1");
		}
		
		if (param.get("numPerPage") == null) {
			param.put("numPerPage", "12");
		}
		
		
		return service.newSearchForPaperBook(param);
	}
	
}
