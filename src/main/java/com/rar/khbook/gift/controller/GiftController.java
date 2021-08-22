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
import java.util.ArrayList;
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
import com.rar.khbook.order.model.vo.GiftOrderList;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.serviceboard.model.vo.NoticeBoard;
import com.rar.khbook.shopingList.model.vo.GiftShopingList;

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

		List<NoticeBoard> nb = service.searchNoticeBoardList();
		
		mv.addObject("notice", nb);
		mv.addObject("list", list);
		mv.setViewName("gift/gift");
		return mv;
	}

//	기프트 상세페이지 이동
	@RequestMapping("/gift/giftDetail.do")
	public ModelAndView giftDetail(int giftNo, ModelAndView mv, String memberId) {
		/* System.out.println("멤버아이디"+memberId); */
		
		if(memberId != null) {
			List<Order> order = service.memberOrderList(memberId);
			List<GiftOrderList> gOrder = service.giftOrderList(giftNo);
			
			for(int i=0; i<gOrder.size(); i++) {
				System.out.println("밤엔 아무도 없었다?"+gOrder.get(i).getOrderNo());
				
			}
			for(int i=0; i<order.size(); i++) {
				System.out.println("밤엔 아무도 오지 않았다."+order.get(i).getOrderNo());
				//String.valueOf(Integer.parseInt(order.get(i).getOrderNo()));
			}
			
			
			mv.addObject("order",order);
		}
		/* System.out.println(giftNo); */
		/* System.out.println(Integer.parseInt(giftNo)); */
		Ngift g = service.giftOne(giftNo);
		List<Ngift> list= new ArrayList();
		//System.out.println("카테고리 코드"+g.getGift_category().getGiftCateCode());
		//System.out.println("기프트 타이틀 "+g.getGift_title());
		
		
		  if(g.getGift_category().getGiftCateCode() == 9) {
			  list = service.giftElec();
		  }else if(g.getGift_category().getGiftCateCode() == 12){ 
			  list = service.giftSupplies();
		  }else if(g.getGift_category().getGiftCateCode() == 10){
			  list = service.giftStorage();
		  }else if(g.getGift_category().getGiftCateCode() == 11){
			  list = service.giftReading();
		  }
		 
		
		double begin = (Math.random()*90); // 0~90

		int num = (int)begin;
		
		//List<Coupon> coupon = service.searchCoupon(memberId);
		
		mv.addObject("begin",num);
		mv.addObject("list", list);
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
		//mv.addObject("coupon", c);
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
	public ModelAndView moreThing(String giftCate, ModelAndView mv) {
		//System.out.println(giftCate);
		String loc = "";
		List<Ngift> list=new ArrayList();
		switch (giftCate) {
		case "e":
			list = service.giftElec();
			loc = "gift/categoryPage1";
			break;
		case "s":
			list = service.giftStorage();
			loc = "gift/categoryPage2";
			break;
		case "r":
			list = service.giftReading();
			loc = "gift/categoryPage3";
			break;
		case "g":
			list = service.giftSupplies();
			loc = "gift/categoryPage4";
			break;
		default:
			break;
		}
		
		double begin = (Math.random()*50); // 0~90

		int num = (int)begin;
		System.out.println(num);
		mv.addObject("begin",num);
		mv.addObject("list", list);
		mv.setViewName(loc);
		return mv;

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
//		System.out.println("리뷰 작성하기 위해 넘어가는 : " + giftNo);
//		System.out.println("리뷰 작성하기 위해 넘어가는 : " + content);
//		System.out.println("리뷰 작성하기 위해 넘어가는 : " + file);
//		System.out.println("리뷰 작성하기 위해 넘어가는 : " + score);
//		System.out.println("리뷰 작성하기 위해 넘어가는 : " + loginMember);

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
		mv.addObject("giftNo", giftNo);
		mv.addObject("msg","리뷰가 등록되었습니다.");
		mv.setViewName("gift/msg2");
		return mv;
	}

	

	@RequestMapping("/gift/giftPayment.do")
	public ModelAndView giftPayment(ModelAndView mv, int giftNo,String loginMemberId, int couponNo, int couponAmount, int quan) {
		//System.out.println("기프트페이먼트 : "+param.get("giftNo"));
		//System.out.println("기프트페이먼트입니다."+couponNo);
		Ngift g = service.giftOne(giftNo);
		//param.put("couponNo", couponNo);
		//param.put("memberId", loginMemberId);
//		int result = service.useCoupon(param);
//		System.out.println("쿠폰 사용 "+result);
		mv.addObject("memberId", loginMemberId);
		if(couponNo>0) {
			mv.addObject("couponNo", couponNo);		
			mv.addObject("couponAmount", couponAmount);			
		}else {
			mv.addObject("couponNo", 0);		
			mv.addObject("couponAmount", 0);	
		}
		mv.addObject("gift",g);
		mv.addObject("quan", quan);
		mv.setViewName("gift/giftPayment");
		return mv;
	}
	
	@RequestMapping("/gift/writePurchaseLog.do")
	@ResponseBody
	public int writePurchaseLog(@RequestParam Map param) {
			
		System.out.println("쿠폰 번호 "+param.get("couponNo"));
		int resultF = service.writeOrderT(param);
		
		if(resultF>0) {
			int result = service.writePurchaseLog(param);		
			return result;
		}else {
			return 0;
		}
		
	}
	@RequestMapping("/gift/salesVolumeAdd.do")
	@ResponseBody
	public int salesVolume(@RequestParam Map param) {

//		System.out.println(" 쿠폰번호 : "+param.get("couponNo"));
//		System.out.println(" 아이디 : "+param.get("memberId"));
//		System.out.println(" 상품번호 : "+param.get("giftNo"));
//		System.out.println(" 상품가격 : "+param.get("totalPrice"));
//		System.out.println(" 구매수량 :"+param.get("stock"));
//		System.out.println(" 멀천트아이디 :"+param.get("merchantUid"));
		
		//int point = (int) Math.round((int) param.get("totalPrice")*0.1);
		
		//System.out.println(" 적립할 포인트 : "+param.get("point"));
		
		//param.put("point", point);
		
		int result = service.updateSalesVolume(param);
		
		return result;
	}
	
	
	  @RequestMapping("/gift/shopingList.do") 
	  public ModelAndView shopingList(@RequestParam Map param, ModelAndView mv) {
	  
//		 내 장바구니 확인
        List<GiftShopingList> list = service.selectCheck(param);
	  //System.out.println("쇼핑리스트에 선택한 상품이 있는지 없는지 단무지 : "+list);
	  //System.out.println("url 타고 넘어온 파람값 : "+param);
	  //System.out.println(param.get("giftNo"));
	  //System.out.println(param.get("quan"));	 
      if(list.isEmpty()) {
    	  int result = service.insertShopingList(param);
    	  mv.addObject("msg", result>0?"장바구니에 등록되었습니다.":"장바구니에 등록에 실패했습니다.");
    	  mv.addObject("loc", "/gift/giftDetail.do?giftNo="+param.get("giftNo"));
    	  mv.setViewName("common/msg");
      }else {
    	  int result = service.updateGiftShopingList(param);
    	  mv.addObject("msg", result>0?"장바구니 수량에 추가 되었습니다.":"장바구니에 등록에 실패했습니다.");
    	  mv.addObject("loc", "/gift/giftDetail.do?giftNo="+param.get("giftNo"));
    	  mv.setViewName("common/msg");
      }
      
	  // System.out.println("장바구니 등록 했으면 1임 : "+result);
	  
	  return mv;
	  
	  }
	 
	  
	  @RequestMapping("/gift/choiceCoupon.do")
	  public ModelAndView choiceCoupon(@RequestParam Map param, ModelAndView mv) {
		  
		  //System.out.println("쿠폰 선택해서 이리로 와 : "+param);
	 
		  return mv;
	  }
	  
	@RequestMapping("/gift/searchGift.do")
	public ModelAndView searchGift(@RequestParam Map param, ModelAndView mv) {
		
		System.out.println("검색 키워드 : "+param.get("keyword"));
		
		List<Ngift> list = service.searchGift(param);
		
		System.out.println("오우 이건 뭐야??"+list);
		mv.addObject("list",list);
		mv.addObject("keyword", param.get("keyword"));
		mv.setViewName("gift/searchGift");
		return mv;
	}

	@RequestMapping("/gift/reviewDetail.do")
	public ModelAndView reivewDetail (ModelAndView mv, int giftNo, int rowNum) {
		
		System.out.println("기프트 넘버"+giftNo);
		System.out.println("리뷰 넘버"+rowNum);
		
		return mv;
	}
	
}
