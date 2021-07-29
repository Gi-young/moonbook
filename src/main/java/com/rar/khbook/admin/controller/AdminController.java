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
	
	@RequestMapping("/admin/removeProductPage.do")
	public ModelAndView removeProductPage(ModelAndView mv) {
		
		mv.setViewName("admin/removeProduct");
		return mv;
	}
	
	
	

}
