package com.rar.khbook.auction.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rar.khbook.auction.model.service.AuctionService;
import com.rar.khbook.auction.model.vo.Auction;
import com.rar.khbook.auction.model.vo.AuctionBid;
import com.rar.khbook.auction.model.vo.AuctionCate;
import com.rar.khbook.common.PageFactory;
import com.rar.khbook.common.PageFactoryAuction;
import com.rar.khbook.member.model.vo.Member;

@Controller
public class AuctionController {
	
	@Autowired
	private AuctionService service;
	
	@RequestMapping("/auction/auction")
	public String auctionMain(Model m,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="5") int numPerpage,
			HttpSession session,@RequestParam Map param) {
		//시간 지난 애들 자동업데이트
		service.updatestate();
		if(session.getAttribute("loginMember")!=null){
		param.put("bidId", ((Member) session.getAttribute("loginMember")).getMemberId());
		m.addAttribute("member",service.selectbidMember(param));
		}
		int totalData =	service.auctionCount();
		m.addAttribute("bannerlist",service.selectbidlist());
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
		mv.addObject("loc","/auction/auction");
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
	
	@RequestMapping("/auction/auctionlist")
	public ModelAndView selectAuctionList(@RequestParam Map param,ModelAndView mv,	
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="5") int numPerpage){
		System.out.println(param);
		int totalData=service.auctionListCount(param);
		mv.addObject("param",param);
		mv.addObject("auctioncate",service.selectAuctionCate());
		mv.addObject("auctionlist",service.selectAuctionList(param,cPage,numPerpage));
		mv.addObject("pageBar",PageFactoryAuction.getOwnPageBar(totalData, cPage, numPerpage, "auctionlist",""));
		mv.setViewName("auction/auctionlist");
		
		return mv;
	}
	
	//////////////옥션 입찰
	
	@RequestMapping("/auction/actionbid.do")
	public String actionbid(@RequestParam Map param,Model m,HttpSession session) {
		if(session.getAttribute("loginMember")!=null){
		param.put("bidId", ((Member) session.getAttribute("loginMember")).getMemberId());
		m.addAttribute("member",service.selectbidMember(param));
		}
		
		
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
	//옥션 추가입찰
	@RequestMapping("/auction/auctionAddbidEnd")
	public String auctionAddbidEnd(@RequestParam Map param,Model m) {
		int update = service.updateAddbid(param);
		if (update>0) {			
			m.addAttribute("msg","등록성공");
		}else {
			m.addAttribute("msg","등록실패");
		}
		return "common/openmsg";
	}
	//옥션 바로구매
	@RequestMapping("/auction/actionbuyNow.do")
	public String auctitonbuynow(@RequestParam Map param,Model m,HttpSession session) {	
		if(session.getAttribute("loginMember")!=null){
		param.put("bidId", ((Member) session.getAttribute("loginMember")).getMemberId());
		m.addAttribute("member",service.selectbidMember(param));
		}
		m.addAttribute("auction",service.selectauctionNo(param));
		System.out.println(param);
		return "auction/auctionbuynow";
	}
	@RequestMapping("/auction/auctionbuynowEnd")
	public String auctionbuynow(@RequestParam Map param,Model m) {
		
		int result = service.insertauctionBid(param);
		if (result>0) {			
			m.addAttribute("msg","등록성공");
			param.put("S", "S");
			service.updatestateS(param);
		}else {
			m.addAttribute("msg","등록실패");
		}
		return "common/openmsg";
	}
	@RequestMapping("/auction/auctionbuynowNeedEnd")
	public String auctionbuynowNeedEnd(@RequestParam Map param,Model m) {
		int result = service.updateAddbid(param);
		if (result>0) {			
			m.addAttribute("msg","등록성공");
			param.put("S", "S");
			service.updatestateS(param);
		}else {
			m.addAttribute("msg","등록실패");
		}
		return "common/openmsg";
		
	}
	
	//물품 클릭
	@RequestMapping("/auction/acutionview")
	public String auctionview(@RequestParam Map param,Model m) {
		m.addAttribute("auction",service.selectauctionNo(param));
		return "auction/auctionview";
	}
	//옥션 판매 내 정보
	@RequestMapping("/auction/auctionmyselllist.do")
	public String auctionMylist(@RequestParam Map param,Model m,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="10") int numPerpage,
			@RequestParam(value="memberId",defaultValue ="") String memberId) {
		String query="&memberId="+memberId;
		int totalData=service.auctionStateCount(param);
		List<Auction> list=service.selectStateList(param,cPage,numPerpage);
		int Y=0;
		int S=0;
		int N=0;
		int B=0;
		for(Auction a:list) {
			if(a.getAuctionState().equals("Y")) {
				Y++;
			}else if(a.getAuctionState().equals("N")) {
				N++;
			}else if(a.getAuctionState().equals("S")) {
				S++;
			}else if(a.getAuctionState().equals("B")) {
				B++;
			}
		}
		m.addAttribute("Y",Y);
		m.addAttribute("N",N);
		m.addAttribute("S",S);
		m.addAttribute("B",B);
		m.addAttribute("totaldata",totalData);
		m.addAttribute("auction", service.selectAuctionList(param, cPage, numPerpage));
		m.addAttribute("pageBar",PageFactoryAuction.getOwnPageBar(totalData, cPage, numPerpage, "auctionmyselllist.do",query));
		return "auction/auctionMySellList";
	}
	//옥션 구매 내정보
	@RequestMapping("/auction/auctionmybuylist.do")
	public String auctionMyBuylist(@RequestParam Map param,Model m,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="10") int numPerpage,
			HttpSession session,
			@RequestParam(value="bidId",defaultValue ="") String bidId) {
		
		int totalData=service.auctionStateCount(param);
		if(session.getAttribute("loginMember")!=null){
		param.put("bidId", ((Member) session.getAttribute("loginMember")).getMemberId());
		m.addAttribute("member",service.selectbidMember(param));
		}
		String query="";
		query="&numPerpage="+numPerpage;
		query+="&bidId="+bidId;
		m.addAttribute("totaldata",totalData);
		List<Auction> list=service.selectStateList(param,cPage,numPerpage);
		int Y=0;
		int S=0;
		int N=0;
		int B=0;
		for(Auction a: list) {
			param.put("auctionNo", a.getAuctionNo());
			Auction auction=service.selectauctionNo(param);	
			System.out.println(auction.getAuctionState()=="S");
			if(auction.getAuctionbid().get(0).getBidPrice()>a.getAuctionbid().get(0).getBidPrice() && auction.getAuctionState().equals("S")) {
				a.setState("유찰");
				N++;
			}else if(a.getAuctionState().equals("B")) {
				B++;
			}else if(a.getAuctionState().equals("Y")) {
				Y++;
			}else{
				a.setState("낙찰");
				S++;
			}
		}	
		m.addAttribute("Y",Y);
		m.addAttribute("N",N);
		m.addAttribute("S",S);
		m.addAttribute("B",B);
		m.addAttribute("auction", list);
		m.addAttribute("pageBar",PageFactoryAuction.getOwnPageBar(totalData, cPage, numPerpage, "auctionmybuylist.do",query));
		
		return "auction/auctionMyBuyList";
	}
	//경매 낙찰 배송지 확인하기
	@RequestMapping("/auction/auctionSpage")
	public String auctionSpage(@RequestParam Map param,Model m) {
		m.addAttribute("member",service.selectbidMember(param));
		m.addAttribute("auction",service.selectauctionNo(param));
		return "auction/auctionSpage";
	}
	//상태 업데이트
	@RequestMapping("/auction/auctionBuySell")
	public String auctionSpageEnd(@RequestParam Map param,Model m) {
		int result = service.auctionBuySell(param);
		if (result>0) {			
			m.addAttribute("msg","확인완료");
		}else {
			m.addAttribute("msg","확인실패");
		}
		return "common/openmsg";
		
	}
	//경매 구매 확인
	@RequestMapping("/auction/auctionBpage")
	public String auctionBpage(@RequestParam Map param,Model m) {
		System.out.println(param);
		m.addAttribute("member",service.selectbidMember(param));
		m.addAttribute("auction",service.selectauctionNo(param));
		return "auction/auctionBpage";
	}
	
	//결제 로직
	@RequestMapping("/auction/auctionpay.do")
	public String auctionpay() {
		return "auction/auctionpay";
	}
	@RequestMapping("/auction/auctionpayEnd.do")
	public void auctionpayEnd(@RequestParam Map param) {
		System.out.println(param);
		service.updateauctionPay(param);
		service.insertBank(param);
		
	}
	//경매 관리 하기
	@RequestMapping("/auction/auctionAdmin")
	public String auctionAdmin(@RequestParam Map param,Model m,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="5") int numPerpage,
			@RequestParam(value="auctionState",defaultValue="") String auctionState,
			@RequestParam(value="buysellState",defaultValue="") String buysellState,
			@RequestParam(value="order",defaultValue="auction_no") String order,
			@RequestParam(value="type",defaultValue="") String type,
			@RequestParam(value="keyword",defaultValue="") String keyword
			) {
		System.out.println(param);
		int totaldata=service.auctionAdmintotal(param);
		String query="";
		query="&numPerpage="+numPerpage;
		query+="&auctionState="+auctionState;
		query+="&buysellState="+buysellState;
		query+="&order="+order;
		query+="&type="+type;
		query+="&keyword="+keyword;					
		m.addAttribute("totaldata",totaldata);
		m.addAttribute("auction",service.auctionAdmin(param,cPage,numPerpage));
		m.addAttribute("pageBar",PageFactoryAuction.getOwnPageBar(totaldata, cPage, numPerpage, "auctionAdmin",query));
		return "auction/auctionAdmin";
	}
	@RequestMapping("/auction/auctionAdminCal")
	public String auctionAdminCal(Model m,@RequestParam Map param) {
		param.put("B", "B");
		int result = service.auctionAdminCal(param);
		if (result>0) {			
			m.addAttribute("msg","확인완료");
		}else {
			m.addAttribute("msg","확인실패");
		}
		m.addAttribute("loc","/auction/auctionAdmin");
		return "common/msg";
	}
	//포인트 환급 
	@RequestMapping("/auction/auctionbidCollect")
	public String auctionbidCollect(Model m,@RequestParam Map param) {
		int result=service.auctionbidCollect(param);
		if (result>0) {			
			m.addAttribute("msg","포인트 환급 성공");
		}else {
			m.addAttribute("msg","포인트 환급 실패");
		}
		m.addAttribute("loc","/auction/auctionmybuylist.do");
		return "common/msg";
	}
	//물품등록 취소하기
	@RequestMapping("/auction/auctionDel")
	public String auctionDel(Model m,@RequestParam Map param) {
		int result=service.auctionDel(param);
		if (result>0) {			
			m.addAttribute("msg","등록 취소 성공");		
		}else {
			m.addAttribute("msg","등록 취소 실패");
		}
			m.addAttribute("loc","/auction/auctionmyselllist.do");
		return "common/msg";
		
	}
	//출금 관리내역
	@RequestMapping("/auction/auctionBank.do")
	public String auctionBank(Model m,@RequestParam  Map param,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="15") int numPerpage) {
		int totaldata=service.auctionBankCount(param);
		m.addAttribute("auctionbank",service.auctionBank(param,cPage,numPerpage));
		m.addAttribute("pageBar",PageFactoryAuction.getOwnPageBar(totaldata, cPage, numPerpage, "auctionBank.do",""));
		return "auction/auctionbank";
	}
	@RequestMapping("/auction/auctionpayout.do")
	public String auctionpayout(HttpSession session,@RequestParam Map param,Model m) {
		if(session.getAttribute("loginMember")!=null){
		param.put("bidId", ((Member) session.getAttribute("loginMember")).getMemberId());
		m.addAttribute("member",service.selectbidMember(param));
		}
		//은행 목록 가져오기
		m.addAttribute("bank",service.selectbank(param));	

		return "auction/auctionpayout";
	}
	@RequestMapping("/auction/auctionpayoutEnd.do")
	public String auctionpayoutEnd(@RequestParam Map param,Model m) {
		System.out.println(param);
		int result=service.insertpayoutEnd(param);
		if (result>0) {			
			m.addAttribute("msg","등록 취소 성공");		
		}else {
			m.addAttribute("msg","등록 취소 실패");
		}
		return "common/openmsg";
		
	}
	@RequestMapping("/auction/auctionChat")
	public String auctionChat() {
		return "auction/chat";
	}
	//배너 나오게하지
	@RequestMapping("/auction/auctionbanner")
	@ResponseBody
	public AuctionBid auctionbanner() {		
		return service.selectauctiobanner();
	}
	
	//회원 입출금 관리
	@RequestMapping("/auction/auctionAdminBank")
	public String auctionAdminBank(Model m,@RequestParam  Map param,
			@RequestParam(value="cPage",defaultValue ="1") int cPage,
			@RequestParam(value="numPerpage",defaultValue ="15") int numPerpage) {
		int totaldata=service.auctionBankCount(param);
		m.addAttribute("auctionbank",service.auctionBank(param,cPage,numPerpage));
		m.addAttribute("pageBar",PageFactoryAuction.getOwnPageBar(totaldata, cPage, numPerpage, "auctionBank.do",""));
		return "auction/auctionAdminBank";
		
	}
	
	@RequestMapping("/auction/acutionAdminBankEnd")
	public String auctionAdminBank(Model m,@RequestParam Map param) {
		int result=service.updateTransactionY(param);
		if (result>0) {			
			m.addAttribute("msg","정산 성공");		
		}else {
			m.addAttribute("msg","정산 실패");
		}
		m.addAttribute("loc","/auction/auctionAdminBank");
		return "common/msg";
	}
	

	
	
	
	
}
