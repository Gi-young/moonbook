package com.rar.khbook.ebook.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Controller
@Slf4j
@SessionAttributes({"loginMember"})
public class EbookController {

	@Autowired
	EbookService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping(value="/ebook/pageEbook.do")
	public String pageEbook() {
		return "ebook/home/ebookHome";
	}
	
	@RequestMapping(value="/ebook/pageBookstallJuvenile.do")
	public String pageBookstallJuvenile() {
		return "ebook/home/bookstallJuvenile";
	}
	
	@RequestMapping(value="/ebook/pageBookstallElementary.do")
	public String pageBookstallElementary() {
		return "ebook/home/bookstallElementary";
	}
	
	@RequestMapping(value="/ebook/pageBookstallMiddle.do")
	public String pageBookstallMiddle() {
		return "ebook/home/bookstallMiddle";
	}
	
	@RequestMapping(value="/ebook/pageBookstallNotes.do")
	public String pageBookstallNotes() {
		return "ebook/home/bookstallNotes";
	}
	
	@RequestMapping(value="/ebook/pageBookstallSearch.do")
	public String pageBookstallSearch() {
		return "ebook/home/bookstallSearch";
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
	public String login() {
		return "ebook/home/login";
	}
	
	@RequestMapping(value="/ebook/openEbookWizard.do")
	public String openEbookReader() {
		return "ebook/wizard/ebookWizard";
	}
	
	@RequestMapping(value="/ebook/pageEbookReader.do")
	public String pageEbookReader() {
		return "ebook/wizard/ebookReader";
	}
	
	@RequestMapping(value="/ebook/pageEbookReport.do")
	public String pageEbookReport() {
		return "ebook/wizard/ebookReport";
	}
	
	@RequestMapping(value="/ebook/pageEbookPlanner.do")
	public String pageEbookPlanner() {
		return "ebook/wizard/ebookPlanner";
	}
	
	@RequestMapping(value="/ebook/pageEbookClub.do")
	public String pageEbookClub() {
		return "ebook/wizard/ebookClub";
	}
	
	@RequestMapping(value="/ebook/pageEbookPublisher.do")
	public String pageEbookPublisher() {
		return "ebook/wizard/ebookPublisher";
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
			message = "업로드 성공";
		} else {
			message = "업로드 실패";
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
	
	@RequestMapping(value = "/ebook/cancelPurchase.do")
	public String cancelPurchase() {
		HttpURLConnection conn = null;
		String access_token = null;
		
		try {
			URL url = new URL("https://api.iamport.kr/users/getToken");
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);
			
			JSONObject obj = new JSONObject();
			obj.put("imp_key", "4908788018841847");
			obj.put("imp_secret", "0592eb6730a3152fabd2d15d1bd842c74cda7b38414a0395f5a0ca5c58b4c94ddeba9e084b02cad2");
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());
			bw.flush();
			bw.close();
			
			int result = 0;
			int responseCode = conn.getResponseCode();
			if(responseCode == 200) {
				System.out.println("refund success");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				while((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				System.out.println("" + sb.toString());
				result = 1;
			} else {
				System.out.println(conn.getResponseMessage());
			}
		} catch(MalformedURLException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "ebook/home/shoppingBasket";
	}
	
	@RequestMapping(value = "ebook/cancel.do")
	public void testCancelPaymentAlreadyCancelledImpUid() {
		IamportClient client;
		
		String test_api_key = "4908788018841847";
		String test_api_secret = "0592eb6730a3152fabd2d15d1bd842c74cda7b38414a0395f5a0ca5c58b4c94ddeba9e084b02cad2";
		client = new IamportClient(test_api_key, test_api_secret);
		
		String test_already_cancelled_imp_uid = "imp_993671723796";
		CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
		
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
			//assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
}
