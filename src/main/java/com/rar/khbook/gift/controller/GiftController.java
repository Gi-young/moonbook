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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.common.PageFactory;
import com.rar.khbook.coupon.model.vo.Coupon;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.gift.model.service.GiftService;
import com.rar.khbook.gift.model.vo.GiftBoard;
import com.rar.khbook.gift.model.vo.Ngift;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GiftController {

	@Autowired
	private GiftService service;

	public static StringBuilder sb;

	/* private List<Ngift> list; */

//	기프트 메인페이지 이동
	@RequestMapping("/gift/giftView.do")
	public ModelAndView giftView(ModelAndView mv) {
		/*
		 * List<Gift> list = service.giftAll();
		 * System.out.println("== 기프트 페이지로 넘기기전 가져온 데이터 == "+list);
		 * mv.addObject("giftList", list);
		 */
		List<Ngift> list = service.giftAll();

		mv.addObject("list", list);
		mv.setViewName("gift/gift");
		return mv;
	}

//	기프트 상세페이지 이동
	@RequestMapping("/gift/giftDetail.do")
	public ModelAndView giftDetail(int giftNo, ModelAndView mv) {
		/* System.out.println(giftNo); */
		/* System.out.println(Integer.parseInt(giftNo)); */
		Ngift g = service.giftOne(giftNo);

		mv.addObject("gift", g);
		mv.setViewName("gift/giftDetail");
		return mv;
	}

// 	내 쿠폰 페이지 
	@RequestMapping("/gift/myCoupon.do")
	public ModelAndView myCoupons(String memberId, ModelAndView mv) {
		
		Member m = service.searchMember(memberId);
		
		List<Coupon> c = service.selectCoupon(memberId);
		/* System.out.println("너 뭘로 넘어오니?? 글루글루 : "+c); */
		
		List<Couponlist> cl = service.selectCouponlist(c);
		//System.out.println("너는 뭘로 넘어오니 ?? ㄱㄺㄹ : "+cl);
		mv.addObject("couponlist", cl);
		mv.addObject("member", m);
		mv.addObject("coupon", c);
		mv.setViewName("gift/myCoupon");
		return mv;
	}

	@RequestMapping("/kakaopay.do")
	@ResponseBody
	public String kakaopay() {
		try {
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) address.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK bc4c8975279f86d69d56a5f54fa529b9");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
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

			if (result == 200) {
				recive = conn.getInputStream();
			} else {
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
		String loc = "";
		switch (giftCate) {
		case "e":
			loc = "gift/categoryPage1";
			break;
		case "s":
			loc = "gift/categoryPage2";
			break;
		case "r":
			loc = "gift/categoryPage3";
			break;
		case "g":
			loc = "gift/categoryPage4";
			break;
		default:
			break;

		}
		/* System.out.println(loc); */

		return loc;

	}

	@RequestMapping("/gift/searchMember.do")
	@ResponseBody
	public String searchMember(String memberId) {
		Member m = service.searchMember(memberId);
		/* System.out.println("============== "+m+" =============="); */
		return "common/msg";

	}

//    네이버 검색 API로 물건 받아오기
//	    @RequestMapping(value="/gift/naverGift.do" , produces = "text/plain;charset=utf-8")	
//	    @ResponseBody
//	    	public StringBuilder main(String[] args, ModelAndView mv) {
//		        String clientId = "h6kv1hW6Ko8D4Yfr7kvc";// 애플리케이션 클라이언트 아이디값";
//		        String clientSecret = "MUlrXb9ksH";// 애플리케이션 클라이언트 시크릿값";\
//		        int display = 100; // 검색결과갯수. 최대100개
//		        try {
//		            String text = URLEncoder.encode("학용품", "utf-8");
//		            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text + "&display=" + display + "&";
//		 
//		            URL url = new URL(apiURL);
//		            HttpURLConnection con = (HttpURLConnection) url.openConnection();
//		            con.setRequestMethod("GET");
//		            con.setRequestProperty("X-Naver-Client-Id", clientId);
//		            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
//		            int responseCode = con.getResponseCode();
//		            BufferedReader br;
//		            if (responseCode == 200) { 
//		                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//		            } else { 
//		                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//		            }
//		            sb = new StringBuilder();
//		            String line = null;
//		           
//		            while ((line = br.readLine()) != null) {	      
//		                sb.append(line + "\n");
//		                System.out.println(line);
//		            }
//		            br.close();
//		            con.disconnect();
//		            
//		            mv.addObject("sb", sb);
//		            mv.setViewName("gift/naverGift");
//		        } catch (Exception e) {
//		            e.printStackTrace();
//		        }
//	    	
//		        return sb;
//		        
//		        
//	    }

//	    @RequestMapping("/gift/insertGift.do")  
//	    @ResponseBody
//	    public int insertGift(@RequestParam Map param) {
//	    	
//	    	System.out.println("============== ajax로 넘어온 값 : "+param.get("title"));
//	    	
//	    	
//	    	int result = service.insertGift(param);
//	    	
//	    	System.out.println("============== 결과 : "+result);
//	    	
//	    	return result;
//	    }

	@RequestMapping("/gift/productReview.do")
	@ResponseBody
	public List<GiftBoard> review(@RequestParam Map param, Model m) {
		//System.out.println("ajax 타고 넘어온 giftNo : " + giftNo);

		List<GiftBoard> gb = service.selectReview(param);

		//System.out.println("service까지 갔다 온 gb : " + gb);

//		 m.addAttribute("pageBar", PageFactory.getOwnPageBar(totalData, cPage, numPerpage, url));

		return gb;
	}

	@RequestMapping("/gift/productReview2.do")
	@ResponseBody
	public String reviewPageBar(int giftNo, ModelAndView mv,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "nunPerpage", defaultValue = "10") int numPerpage) {

		int totalData = service.selectReviewAll(giftNo);
		
		//System.out.println("totalData" + totalData);

		String getOwnPageBar = PageFactory.getWonJaePageBar(totalData, cPage, numPerpage);
		//System.out.println(getOwnPageBar);
		return getOwnPageBar;
	}

	@RequestMapping("/gift/insertReview")
	public ModelAndView insertReview(int giftNo, ModelAndView mv) {
		Ngift g = service.giftOne(giftNo);
		mv.addObject("g", g);
		mv.addObject("giftNo", giftNo);
		mv.setViewName("gift/insertReview");
		return mv;
	}

//	insertReview.jsp 에서 넘어오는 폼 값을 받는 컨트롤러
	@RequestMapping("/gift/reviewWrite.do")
	public ModelAndView reviewWrite(int giftNo, ModelAndView mv, String content, MultipartFile file, int score, String loginMember) {
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + giftNo);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + content);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + file);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + score);
		System.out.println("리뷰 작성하기 위해 넘어가는 : " + loginMember);

		HashMap<String, Object> map = new HashMap<>();
		
		map.put("giftNo", giftNo);
		map.put("content", content);
		map.put("img", file);
		map.put("score", score);
		map.put("memberId", loginMember);
			
		int result = service.reviewWrite(map);

		/*
		 * mv.addObject("msg", ); mv.addObject("loc", ); mv.setViewName("");
		 */
		
		mv.setViewName("gift/giftDetail.do?giftNo="+giftNo);
		return mv;
	}

	

	@RequestMapping("/gift/giftPayment.do")
	public ModelAndView giftPayment(int giftNo, ModelAndView mv, int quan) {
		Ngift g = service.giftOne(giftNo);
		mv.setViewName("gift/giftPayment");
		mv.addObject("gift", g);
		mv.addObject("quan", quan);
		return mv;
	}

	@RequestMapping("/gift/salesVolume.do")
	@ResponseBody
	public int salesVolume(@RequestParam Map param) {
		System.out.println("파람이 잘 넘어오는지 : "+param);

		System.out.println(" 아이디 : "+param.get("memberId"));
		System.out.println(" 상품번호 : "+param.get("giftNo"));
		System.out.println(" 상품가격 : "+param.get("totalPrice"));
		System.out.println(" 구매수량 :"+param.get("stock"));
		
		int result = service.updateSalesVolume(param);
		
		return result;
	}
	
	
	  @RequestMapping("/gift/shopingList.do") 
	  public ModelAndView shopingList(@RequestParam Map param, ModelAndView mv) {
	  
	  //System.out.println("url 타고 넘어온 파람값 : "+param);
	  //System.out.println(param.get("giftNo"));
	  //System.out.println(param.get("quan"));	  
	  int result = service.insertShopingList(param);
	  // System.out.println("장바구니 등록 했으면 1임 : "+result);
	  mv.addObject("msg", result>0?"장바구니에 등록되었습니다.":"장바구니에 등록에 실패했습니다.");
	  mv.addObject("loc", "/gift/giftDetail.do?giftNo="+param.get("giftNo"));
	  mv.setViewName("common/msg");
	  return mv;
	  
	  }
	 
	  
	  @RequestMapping("/gift/choiceCoupon.do")
	  public ModelAndView choiceCoupon(@RequestParam Map param, ModelAndView mv) {
		  
		  System.out.println("쿠폰 선택해서 이리로 와 : "+param);
		  
		  
		 
		  return mv;
	  }
	  
	

}
