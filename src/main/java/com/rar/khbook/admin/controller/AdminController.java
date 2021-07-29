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
//	@RequestMapping("/admin/outputProduct1.do")
//	public ModelAndView outputProduct1(ModelAndView mv,@RequestParam Map param) {
//		
//		//상민님 판매량을 몇개 판매했다는 뜻인가요 아님 매출액의 price를 의미하는건가요
//		
//		//출고를 하려면 재고에서 -1 판매량에서 +1 해줘야 함
//		//다만 배송상태를 넣지 않았음
//		//판매량 계산을 해줘야 함
//		//매출액 = 변동비 +고정비 +이익
//		//판매량..계산.. (할인된 가격 * 출고 개수)+배송비= 물건 살 때의 고정비
//		//이익 계산 (사람에게 팔 할인된 가격)-입고가= 이익 ※단 배송회사의 줄 돈은 고려 안했음 
//		//잠시만 그러면 컬럼의 입고가가 필요함..미치겠음 등록 뜯어고칠 준비
//		//해당하는 번호의 price를 hidden으로 넣고 들고 가야함
//		int result=service.outputProduct1(param);
//		
//		String msg="";
//		String loc="";
//		if(result>0) {
//			msg="출고가 정상적으로 처리되었습니다";
//		}else {
//			msg="출고가 실패되었습니다.";
//		}
//		loc="/admin/removeProductPage.do";
//		
//		
//		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
//		mv.setViewName("common/msg");
//		
//		
//		
//		return mv;
//		
//	}
	
	
	
	
	

}
