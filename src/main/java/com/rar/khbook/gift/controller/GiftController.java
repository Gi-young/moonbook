package com.rar.khbook.gift.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GiftController {
	
//	@Autowired
//	private GiftService service;
	
//	기프트 메인페이지 이동
	@RequestMapping("/gift/giftView.do")
	public String giftView() {
		return "gift/gift";
	}
	
//	기프트 상세페이지 이동
	@RequestMapping("/gift/giftDetail.do")
	public String giftDetail(int giftNo) {
		
		return "gift/giftDetail";
	}
	
// 	내 쿠폰 페이지 
	@RequestMapping("/gift/myCoupon.do")
	public String myCoupons() {
		return "gift/myCoupon";
	}
	
	@RequestMapping("/kakaopay.do")
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK bc4c8975279f86d69d56a5f54fa529b9");
			conn.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			String param = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:9095/success&cancel_url=http://localhost:9095/fail&fail_url=http://localhost:9095/cancel";
			OutputStream give = conn.getOutputStream();
//			conn.getOutputStream을 통해서 보내야할 데이터를 보낼 수 있게 되었다.
			DataOutputStream dataGive = new DataOutputStream(give);
			dataGive.writeBytes(param);
			dataGive.flush();
			dataGive.close();
			
			int result = conn.getResponseCode();
			/* System.out.println("결과 결과 결과 : "+result); */
			InputStream recive;
			
			if(result == 200) {
				recive = conn.getInputStream();
			}else {
				recive = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(recive);
			BufferedReader convert = new BufferedReader(reader);
			/* System.out.println("컨버트 리드라인 : "+convert.readLine()); */
			return convert.readLine();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}

	 @RequestMapping("/gift/moreThing.do")
	 public String moreThing(String giftCate) {
		 System.out.println(giftCate);
		 String loc="";
		 switch(giftCate) {
		 case "e" : loc="gift/categoryPage1";break;
		 case "s" : loc="gift/categoryPage2";break;
		 case "r" : loc="gift/categoryPage3";break;
		 case "g" : loc="gift/categoryPage4";break;
		 default : break;
		 
		 }
		 System.out.println(loc);
		 
		 return loc;
		 
	 }
}
