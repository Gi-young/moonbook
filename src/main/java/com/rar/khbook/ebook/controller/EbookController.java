package com.rar.khbook.ebook.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Controller
@Slf4j
public class EbookController {

	@Autowired
	EbookService service;
	
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
	public String pageEbookDetail() {
		return "ebook/home/ebookDetail";
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
	
	@RequestMapping(value = "/ebook/search.do")
	@ResponseBody
	public List<EbookDatabind> search(@RequestParam Map param) {
		
		System.out.println("search.do : " + param);
		
		List<EbookDatabind> list = service.search(param);
		
		return list;
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
