package com.rar.khbook.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.admin.model.service.AdminService;
import com.rar.khbook.common.PageFactory;
import com.rar.khbook.common.PageFactoryAdmin;

import com.rar.khbook.ebook.model.vo.EbookDatabind;
import com.rar.khbook.gift.model.vo.Gift;
import com.rar.khbook.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	//회원 관리 페이지 31~120 소스코드
	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {
		return "admin/adminPage";
	}
	@RequestMapping("/admin/adMemberPage.do")
	public ModelAndView adListMember(
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,ModelAndView mv
			) {
		
		List<Member> listT=service.selectMemberList(cPage,numPerpage);
		
		/* List<Member> listT2=service.memberHowT(param); */
		
		
		mv.addObject("list",listT);
		/*
		 * if(param.get("type1")==null) { }else if(param.get("type1")!=null) {
		 * mv.addObject("listT2",listT2);
		 * mv.addObject("list",listT2); }
		 */
		
		int totalData=service.selectMemberCount();
		
		mv.addObject("totalContents",totalData);
		mv.addObject("pageBar",PageFactory.getOwnPageBar(totalData, cPage, numPerpage, "adMemberPage.do"));
		mv.setViewName("admin/adminMemberPage");
		
		return mv;
	}
	@RequestMapping("/admin/memberDelete.do")
	public ModelAndView memberDelete(ModelAndView mv,String memberId){
		
		/* log.debug(memberId); */
		/* System.out.println("테스트중입니다. 아이디제발 :"+memberId); */
		int result=service.memberDelete(memberId);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제되었습니다";
			
		}else {
			msg="삭제실패";
		}
		loc="/admin/adMemberPage.do";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	@RequestMapping("/admin/memberUpdate.do")
	public ModelAndView memberUpdate(ModelAndView mv,@RequestParam Map param) {
		
		int result=service.memberUpdate(param);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정되었습니다";
			
		}else {
			msg="수정실패";
		}
		loc="/admin/adMemberPage.do";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	
	}
	
	@RequestMapping("/admin/orderedMemberList.do")
	@ResponseBody
	public List<Member> orderedMemberList(@RequestParam Map param) {
		List<Member> list = service.memberHowT(param);
		/* new Gson().toJson(list); */
		
		/* return new Gson().toJson(list).toString(); */
		return list;
	}
	@RequestMapping("/admin/searchTextMemberList.do")
	@ResponseBody
	public List<Member> searchTextMemberList(@RequestParam Map param){
		
		List<Member> list =service.memberHowT2(param);
		
		return list;
	}
	
	//판매내역 페이지 멈춤
	@RequestMapping("/admin/adSalePage.do")
	public ModelAndView adSalePage(@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue="10") int numPerpage,ModelAndView mv) {
		
		List<Order> list=service.selectOrderList(cPage,numPerpage);
		
		
		mv.setViewName("admin/adminSalePage"); 
		return mv;
	}
	//제품관리 페이지 시작
	//등록 전환용 페이지
	@RequestMapping("/admin/addProductPage.do")
	public ModelAndView addProductPage(ModelAndView mv) {
		
		mv.setViewName("admin/addProduct");
		return mv;
	}
	//등록할 책 페이지 
	@RequestMapping("/admin/addProductPage2.do")
	public ModelAndView addProductPage2(ModelAndView mv,int categoryCode) {
		mv.addObject("categoryCode", categoryCode);
		mv.setViewName("admin/addProduct2");
		return mv;
	}
	//등록할 상품 페이지 
	@RequestMapping("/admin/addProductPage3.do")
	public ModelAndView addProductPage3(ModelAndView mv,int categoryCode) {
		mv.addObject("categoryCode", categoryCode);
		mv.setViewName("admin/addProduct3");
		return mv;
	}
	//입고
	@RequestMapping("/admin/inputProductPage2.do")
	public ModelAndView inputProductPage2(ModelAndView mv) {
			mv.setViewName("admin/inputProduct2");
			return mv;
	}
	
	//출고
	@RequestMapping("/admin/removeProductPage.do")
	public ModelAndView removeProductPage(ModelAndView mv) {
		
		mv.setViewName("admin/removeProduct");
		return mv;
	}
	//1.book  3.gift 등록
	@RequestMapping("/admin/insertProduct1.do")
	public ModelAndView insertProduct1(ModelAndView mv,@RequestParam Map param,String categoryCode) {
		//책등록
		int result=service.insertProduct1(param);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="책 등록이 정상적으로 처리되었습니다";
		}else {
			msg="책 등록이 실패되었습니다.";
		}
		loc="/admin/addProductPage2.do?categoryCode="+categoryCode;
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("categoryCode", categoryCode);
		mv.setViewName("common/msg");
		
		return mv;
	}
	//기프트 등록
	@RequestMapping("/admin/insertProduct3.do")
	public ModelAndView insertProduct3(ModelAndView mv,@RequestParam Map param,int gift_giftcate_code) {
		
		int result=service.insertProduct3(param);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품 등록이 정상적으로 처리되었습니다";
		}else {
			msg="상품 등록이 실패되었습니다.";
		}
		loc="/admin/addProductPage3.do?categoryCode="+gift_giftcate_code;
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.addObject("categoryCode", gift_giftcate_code);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	
	@RequestMapping("/admin/updateProduct1.do")
	public ModelAndView updateProduct1(ModelAndView mv,@RequestParam Map param) {
		//책 입고
		int result=service.updateProduct1(param);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="입고가 정상적으로 처리되었습니다";
		}else {
			msg="입고가 실패되었습니다.";
		}
		loc="/admin/inputProductPage2.do";
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	//기프트 입고
	@RequestMapping("/admin/updateProduct3.do")
	public ModelAndView updateProduct3(ModelAndView mv,@RequestParam Map param) {
		
		int result=service.updateProduct3(param);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="입고가 정상적으로 처리되었습니다";
		}else {
			msg="입고가 실패되었습니다.";
		}
		loc="/admin/inputProductPage2.do";
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	//이익을 위한 가격 가져오기 책버전 -->기능 이전 분석파트
	@RequestMapping("/admin/bringPrice.do")
	@ResponseBody
	public EbookDatabind searchBringPrice(int bindNo) {
		
		EbookDatabind price1=service.searchBringPrice(bindNo);
		
		return price1;
	}
	//이익을 위한 가격 가져오기 기프트 --> 기능 이전 분석파트
	
	
	//출고 전 재고 체크 book버전
	@RequestMapping("/admin/checkStock1.do")
	@ResponseBody
	public boolean checkStock1(int bindNo,int stock) {
		
		EbookDatabind result=service.checkStock1(bindNo);
		//수정, 업데이트 딜리트
		//select  stock의 정수값
		
		
		System.out.println("출고전 재고 체크:" +result);
		System.out.println("출고전 output할 stock 체크:" +stock);
		
		if(result.getStock()>=stock) { 
			return true;
		}else {
			return false;
		}
	}
	//출고 전 재고 체크 gift버전
	@RequestMapping("/admin/checkStock3.do")
	@ResponseBody
	public boolean checkStock3(int gift_no,int gift_count) {
		
		Gift result=service.checkStock3(gift_no);
		
		System.out.println("출고전 재고 체크:" +result);
		System.out.println("출고전 output할 stock 체크:" +gift_count);
		
		if(result.getGift_count()>=gift_count) { 
			return true;
		}else {
			return false;
		}
	}
	
	//책 출고
	@RequestMapping("/admin/outputProduct1.do")
	public ModelAndView outputProduct1(ModelAndView mv,@RequestParam Map param) {
		
		//판매량을 몇개 판매했다는 뜻
		//출고를 하려면 재고에서 -출고 개수 
		int result1=service.outputProduct1(param);
		//판매량에서 +출고개수 해줘야 함
		int result2=service.updateSalesVolume1(param);
		//매출액계산 -->결제테이블에서 쏴주시기로 함 신경 쓸 필요 없음 -분석파트로 넘김
		
		//이익 계산 ((가격)-입고가)*판매량= 이익  ※단 진짜 결제된 금액에서 차감 -분석파트로 넘김
		
		//입고가 컬럼이 prime_cost(원가) 컬럼
		//출고 완료
		
		String msg="";
		String loc="";
		if(result1>0 && result2>0) {
			msg="출고가 정상적으로 처리되었습니다";
		}else {
			msg="출고가 실패되었습니다.";
		}
		loc="/admin/removeProductPage.do";
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	//eBook 출고
	@RequestMapping("/admin/outputProduct2.do")
	public ModelAndView outputProduct2(ModelAndView mv,@RequestParam Map param) {
		
		//판매량에서 +출고개수 해줘야 함
		//ebook은 재고 필요 없이 바로 판매량 update
		int result2=service.updateSalesVolume2(param);
		
		
		String msg="";
		String loc="";
		if(result2>0) {
			msg="eBook 출고가 정상적으로 처리되었습니다";
		}else {
			msg="eBook 출고가 실패되었습니다.";
		}
		loc="/admin/removeProductPage.do";
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	//gift 출고
	@RequestMapping("/admin/outputProduct3.do")
	public ModelAndView outputProduct3(ModelAndView mv,@RequestParam Map param) {
		
		//재고에서 -출고 개수 && 판매량에서 +출고개수 
		int result=service.outputAndupdateSalesVolume3(param);
		
		
		String msg="";
		String loc="";
		
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	//재고현황
	@RequestMapping("/admin/stockProductPage.do")
	public ModelAndView stockProductPage(@RequestParam(value="cPage",defaultValue="1") int cPage,
										 @RequestParam(value="numPerpage",defaultValue="10") int numPerpage,
										 @RequestParam(value="stockParam", required=false) String stockParam,
										 ModelAndView mv) {
		
		//System.out.println("컨트롤러 테스트 : " + stockParam);
		
		List<EbookDatabind> listT=service.selectEbookDatabindList(cPage,numPerpage);
		List<Gift> listT2=service.selectGiftList(cPage,numPerpage);
		
		mv.addObject("list", listT);
		mv.addObject("list2", listT2);
		
		int totalData=service.selectEbookDataCount();
		int totalData2=service.selectGiftCount();
		
		mv.addObject("totalContents", totalData);
		mv.addObject("totalContents2", totalData2);
		
		
		

		mv.addObject("pageBar",PageFactoryAdmin.getPageBar(totalData, cPage, numPerpage,"stockProductPage.do","book"));
		
		mv.addObject("pageBar2",PageFactoryAdmin.getPageBar2(totalData2, cPage, numPerpage,"stockProductPage.do","gift"));

		mv.addObject("stockParam",stockParam);
		mv.setViewName("admin/stockProduct");
		
		return mv;
	}
	
	//재고 ~이상 ~ 미만 book버전
	@RequestMapping("/admin/orderStockList.do")
	@ResponseBody
	public List<EbookDatabind> orderStockList(@RequestParam Map param) {
		
		int stockNum1 = Integer.parseInt((String)param.get("stockNum1"));
		param.put("stockNum1", stockNum1);
		int stockNum2 = Integer.parseInt((String)param.get("stockNum2"));
		param.put("stockNum2", stockNum2);
		
		System.out.println("재고 정렬 book:"+param.get("cPage"));
		System.out.println("재고 정렬 book:"+param.get("numPerpage"));
		
		
		
		List<EbookDatabind> list=service.orderStockList(param);
		
		
		
		return list;
	}
	// 재고 정렬 book 페이지바 
	@RequestMapping("/admin/getPageBarOrderList.do")
	@ResponseBody
	public String[] getPageBarOrderList(@RequestParam Map param) {
		
		
		
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		int totalContents=service.getPageBarOrderList(param);
		
		//mv.addObject("totalContents", totalData);
		String[] resultArr = new String[2];
		
		String pageBar = PageFactoryAdmin.getPageBar3(totalContents, cPage, numPerpage,null,null);
		resultArr[0]=pageBar;
		resultArr[1]= Integer.toString(totalContents);
		
		System.out.println("재고 정렬바 book:"+param.get("cPage"));
		System.out.println("재고 정렬바 book:"+param.get("numPerpage"));
		
		return resultArr;
	}
	
	//재고 ~이상 ~ 미만 gift버전
	@RequestMapping("/admin/orderStockList3.do")
	@ResponseBody
	public List<Gift> orderStockList3(@RequestParam Map param) {
		
		int stockNum1 = Integer.parseInt((String)param.get("stockNum1"));
		param.put("stockNum1", stockNum1);
		int stockNum2 = Integer.parseInt((String)param.get("stockNum2"));
		param.put("stockNum2", stockNum2);
		
		
		
		List<Gift> list2=service.orderStockList3(param);
		
		return list2;
	}
	// 재고 정렬 gift 페이지바 
	@RequestMapping("/admin/getPageBarOrderList3.do")
	@ResponseBody
	public String[] getPageBar2(@RequestParam Map param) {
		
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		int totalContents2=service.getPageBarOrderList3(param); //gift
		
		String[] resultArr2 = new String[2];
		
		String pageBar = PageFactoryAdmin.getPageBar3(totalContents2, cPage, numPerpage,null,null);
		
		resultArr2[0] = pageBar;
		resultArr2[1] = Integer.toString(totalContents2);
		
		
		return resultArr2;
	}
	
	//검색 책
	@RequestMapping("/admin/searchTextStockList.do")
	@ResponseBody
	public List<EbookDatabind> searchTextStockList(@RequestParam Map param) {
		
		String type4=(String)param.get("type4");
		param.put("type4", type4);
		String search5=(String)param.get("search5");
		param.put("search5", search5);
		
		System.out.println("검색책에서"+param.get("cPage"));
		System.out.println("검색책에서"+param.get("numPerpage"));
		
		List<EbookDatabind> list=service.searchTextStockList(param);
		
		return list;
	}
	// 재고 검색 book 페이지바 
	@RequestMapping("/admin/getPageBarTextStockList.do")
	@ResponseBody
	public String[] getPageBarTextStockList(@RequestParam Map param) {
		
		String type4=(String)param.get("type4");
		param.put("type4", type4);
		String search5=(String)param.get("search5");
		param.put("search5", search5);
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		int totalContents=service.getPageBarTextStockList(param);
		
		System.out.println("검색바에서"+param.get("cPage"));
		System.out.println("검색바에서"+param.get("numPerpage"));
		
		String[] resultArr = new String[2];
		
		String pageBar = PageFactoryAdmin.getPageBar4(totalContents, cPage, numPerpage,null,null);
		resultArr[0]=pageBar;
		resultArr[1]= Integer.toString(totalContents);
		
		
		return resultArr;
	}
	
	//검색 gift
	@RequestMapping("/admin/searchTextStockList3.do")
	@ResponseBody
	public List<Gift> searchTextStockList3(@RequestParam Map param) {
		
		String type4=(String)param.get("type4");
		param.put("type4", type4);
		String search5=(String)param.get("search5");
		param.put("search5", search5);
		
		List<Gift> list2=service.searchTextStockList3(param);
		
		return list2;
	}
	
	// 재고 검색 gift 페이지바
	@RequestMapping("/admin/getPageBarTextStockList3.do")
	@ResponseBody
	public String[] getPageBarTextStockList3(@RequestParam Map param) {
		
		String type4=(String)param.get("type4");
		param.put("type4", type4);
		String search5=(String)param.get("search5");
		param.put("search5", search5);
		
		int cPage = Integer.parseInt((String)param.get("cPage"));
		int numPerpage = Integer.parseInt((String)param.get("numPerpage"));
		
		int totalContents2=service.getPageBarTextStockList3(param); //gift
		
		String[] resultArr2 = new String[2];
		
		String pageBar = PageFactoryAdmin.getPageBar4(totalContents2, cPage, numPerpage,null,null);
		
		resultArr2[0] = pageBar;
		resultArr2[1] = Integer.toString(totalContents2);
		
		
		return resultArr2;
	}
	// 책 수정하기
	@RequestMapping("/admin/stockTUpdate.do")
	@ResponseBody
	public boolean stockTUpdate(@RequestParam Map param) {
		
		int result=service.stockTUpdate(param);
		
		if(result>0) { 
			return true;
		}else {
			return false;
		}
	}
	// gift 수정하기
	@RequestMapping("/admin/stockTUpdate2.do")
	@ResponseBody
	public boolean stockTUpdate2(@RequestParam Map param) {
		
		int result=service.stockTUpdate2(param);
		
		if(result>0) { 
			return true;
		}else {
			return false;
		}
	}
	// book 삭제하기 
	@RequestMapping("/admin/stockTDelete.do")
	@ResponseBody
	public boolean stockTDelete(@RequestParam Map param) {
		
		int result=service.stockTDelete(param);
		
		if(result>0) { 
			return true;
		}else {
			return false;
		}
	}
	// gift 삭제하기 
	@RequestMapping("/admin/stockTDelete2.do")
	@ResponseBody
	public boolean stockTDelete2(@RequestParam Map param) {
		
		int result=service.stockTDelete2(param);
		
		if(result>0) { 
			return true;
		}else {
			return false;
		}
	}
	
	
	
}
