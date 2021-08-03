package com.rar.khbook.auction.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.auction.model.service.AuctionService;
import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.common.PageFactory;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	@RequestMapping("/auction/auction.do")
	public String auctionMain(Model m,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="5") int numPerpage) {
		//시간 지난 애들 자동업데이트
		service.updatestate();
		
		
		
		int totalData =	service.auctionCount();
		m.addAttribute("auctioncate",service.selectAuctionCate());
		m.addAttribute("timelist", service.selectTimeList(cPage,numPerpage));
		m.addAttribute("poplist",service.selectpoplist());
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "auction/auction.do"));
			
		return "auction/auction";
	}
	
	@RequestMapping("/auction/auctionwrite.do")
	public String auctionWrite() {
		return "auction/auctionwrite";
	}
	
	@RequestMapping("/auction/auctionwriteEnd.do")
	public ModelAndView auctionWriteEnd(Auction a,ModelAndView mv,MultipartFile[] upfile,HttpServletRequest req) {
		
		System.out.println(upfile[0].getOriginalFilename());
		System.out.println(upfile[0].getSize());
		List<String> list =new ArrayList<String>();
		String path=req.getServletContext().getRealPath("/resources/auction/images/");
		File dir =new File(path);
		if(!dir.exists()) dir.mkdirs();
		for(MultipartFile f : upfile) {
			if(!f.isEmpty()) {
				String oriFilename=f.getOriginalFilename();		
				try {
					f.transferTo(new File(path+oriFilename));
					list.add(oriFilename);
					System.out.println(list);
				}catch(IOException e) {
					e.printStackTrace();
				}	
			}
		}
		String[] img = list.toArray(new String[list.size()]);
		String msg="등록성공";
		a.setAuctionImg(img);
		System.out.println(a);
		try {
			service.auctionWriteEnd(a);
		} catch (Exception e) {
			msg=e.getMessage();
		}
		System.out.println(a);
		mv.addObject("msg",msg);
		mv.addObject("loc","/auction/auction.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	//카테고리 선택
	@RequestMapping("/auction/auctioncate.do")
	@ResponseBody
	public List<AuctionCate> selectauctioncate(String catename) {
		return service.selectauctioncate(catename);
	}
	
	@RequestMapping("/auction/auctioncateCode.do")
	@ResponseBody
	public AuctionCate selectauctioncateNCode(@RequestParam Map param) {
		System.out.println(param);
		return service.selectauctioncateCode(param);
	}
	

	
	/////////////////////////////////////////////////////
	
	
	//리스트 
	
	@RequestMapping("/auction/auctionlist.do")
	public ModelAndView selectAuctionList(@RequestParam Map param,ModelAndView mv,	
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="5") int numPerpage){
		System.out.println(param);
		int totalData=service.auctionListCount(param);
		mv.addObject("auctioncate",service.selectAuctionCate());
		mv.addObject("auctionlist",service.selectAuctionList(param,cPage,numPerpage));
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerpage, "auction/auctionlist.do"));
		mv.setViewName("auction/auctionlist");
		
		return mv;
	}
	
	//////////////옥션 입찰
	
	@RequestMapping("/action/actionbid")
	public String actionbid(@RequestParam Map param,Model m) {
		
		m.addAttribute("auction",service.selectauctionNo(param));
		System.out.println(param);
		return "auction/auctionbid";
	}
	@RequestMapping("/auction/auctionbidEnd")
	public String auctionbidEnd(@RequestParam Map param,Model m) {
	
		int result = service.insertauctionBid(param);
		if (result>0) {			
			m.addAttribute("msg","등록성공");
		}else {
			m.addAttribute("msg","등록실패");
		}
		return "common/openmsg";
	}
	//물품 클릭
	@RequestMapping("/auction/acutionview.do")
	public String auctionview(@RequestParam Map param,Model m) {
		m.addAttribute("auction",service.selectauctionNo(param));
		return "auction/auctionview";
	}
	
	
	
}
