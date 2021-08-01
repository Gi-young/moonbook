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
import com.rar.khbook.ebook.controller.EbookController;
import com.rar.khbook.ebook.model.vo.EbookDatabind;
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
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "adMemberPage.do"));
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
	//등록
	@RequestMapping("/admin/addProductPage.do")
	public ModelAndView addProductPage(ModelAndView mv) {
		
		mv.setViewName("admin/addProduct");
		return mv;
	}
	@RequestMapping("/admin/addProductPage2.do")
	public ModelAndView addProductPage2(ModelAndView mv,int categoryCode) {
		
		mv.addObject("categoryCode", categoryCode);
		mv.setViewName("admin/addProduct2");
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
	
	//이익을 위한 가격 가져오기 책버전
	@RequestMapping("/admin/bringPrice.do")
	@ResponseBody
	public EbookDatabind searchBringPrice(int bindNo) {
		
		EbookDatabind price1=service.searchBringPrice(bindNo);
		
		return price1;
	}
	//이익을 위한 가격 가져오기 기프트
	
	
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
	
	//재고현황
	@RequestMapping("/admin/stockProductPage.do")
	public ModelAndView stockProductPage(@RequestParam(value="cPage",defaultValue="1") int cPage,
										 @RequestParam(value="numPerpage",defaultValue="10") int numPerpage,ModelAndView mv) {
		
		List<EbookDatabind> listT=service.selectEbookDatabindList(cPage,numPerpage);
		
		mv.addObject("list", listT);
		
		int totalData=service.selectEbookDataCount();
		
		mv.addObject("totalContents", totalData);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage,"stockProductPage.do"));
		mv.setViewName("admin/stockProduct");
		
		return mv;
	}
	
	
	
	

}
