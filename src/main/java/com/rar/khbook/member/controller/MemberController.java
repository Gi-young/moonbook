package com.rar.khbook.member.controller;

import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.rar.khbook.common.PageFactory;
import com.rar.khbook.coupon.model.vo.Couponlist;
import com.rar.khbook.coupon.model.vo.OrderWithCoupon;
import com.rar.khbook.member.model.service.MemberService;
import com.rar.khbook.member.model.vo.Member;
import com.rar.khbook.member.model.vo.Membergrade;
import com.rar.khbook.order.model.vo.Order;
import com.rar.khbook.order.model.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({ "loginMember" })
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("/member/loginPage.do")
	public String loginPage() {

		return "member/login";
	}

	@RequestMapping("/member/login.do")
	public String login(@RequestParam Map param, Model model, HttpSession session, HttpServletResponse res) {

		boolean visitFlag = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());

		String saveId = (String) param.get("saveId");
		String memberId = (String) param.get("memberId");
		System.out.println(param.get("memberPw"));
		if (saveId != null) {
			Cookie c = new Cookie("saveId", memberId);
			c.setMaxAge(7 * 24 * 60 * 60);

			res.addCookie(c);
		} else {
			Cookie c = new Cookie("saveId", "");
			c.setMaxAge(0);
			res.addCookie(c);
		}

		Member m = service.selectOneMember(param);
		System.out.println(m);
		String msg = "";
		if (m != null) {

			if (pwEncoder.matches((String) param.get("memberPw"), m.getMemberPw())) {
				session.setAttribute("loginMember", m);
				System.out.println("아니 여기" + param.get("memberPw") + "ddd" + m.getMemberPw());
//				로그인한 멤버의 쿠폰도 SESSION에 넣어줌
				List<OrderWithCoupon> c = service.getCoupon(m);
				session.setAttribute("coupon", c);
//				로그인한 멤버의 회원등급도 Session에 넣어줌
				Membergrade mg = service.getMembergrade(m);
				session.setAttribute("membergrade", mg);

				// 최근 로그인한 날짜 구하기
				// 컬럼에 있는 가장 최근 로그인 날짜 ==오늘 ->아무것도 안함
				// 컬럼에 있는 가장 최근 로그인 날짜 !==오늘 ->방문 횟수 +1 ,최근 로그인 날짜 =오늘날짜
				System.out.print(m.getMemberToday().toString());
				System.out.println("today :" + today);
				if (!m.getMemberToday().toString().equals(today)) {
					int memberVisit = service.updateMemberVisit(param);
					int memberToday = service.updateMemberToday(param);
				}
				msg = "로그인 성공";

//		재로그인 flag를 확인 후, 로그인에 성공하면 마이룸 회원정보수정으로 연결
				if (param.get("reLogin") != null && ((String) param.get("reLogin")).equals("y")) {
					return "myroom/updateMember";
				}
				model.addAttribute("loc", "/");
			} else {
				msg = "로그인 실패";
				model.addAttribute("loc", "/member/loginPage.do");
			}
		} else {
			msg = "로그인 실패";
		}
//		재로그인 flag를 확인 후, 로그인에 실패하면 마이룸 메인으로 연결
		if (param.get("reLogin") != null && ((String) param.get("reLogin")).equals("y")) {

			model.addAttribute("loc","/member/myroom/reLogin.do");
		}
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus ss) {

		if (!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}

	@RequestMapping("/member/enrollPage.do")
	public String enrollPage() {
		return "member/enrollPage";
	}

	@RequestMapping("/member/enrollUser.do")
	public String enrollUser() {
		return "member/enrollUser";
	}

	@RequestMapping("/member/enrollUser2.do")
	public String enrollUser2() {
		return "member/enrollUser2";
	}

	@RequestMapping("/member/memberEnrollEnd.do")

	public String memberEnrollEnd(Member m, Model model, HttpSession session) {

		System.out.println(m);
		log.debug("암호화전 : {}", m.getMemberPw());
		log.debug("암호화 후 : {}", pwEncoder.encode(m.getMemberPw()));
		m.setMemberPw(pwEncoder.encode(m.getMemberPw()));

		System.out.println("testtest : " + m.getMemberBirth());

		int result = service.insertMember(m);
		String msg = "";
		String loc = "";

		if (result > 0) {
			msg = "회원가입성공";
			int result3 = service.createShopingList(m);
			log.debug("회원가입 후 장바구니 만들기 성공 실패 {}", result3);
			loc = "/";
			session.setAttribute("flag", true);
		} else {
			msg = "회원가입실패";
			loc = "/member/enrollUser2.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";

	}

	@RequestMapping("/member/checkId.do")
	public void checkId(@RequestParam Map param, Writer out) {
		System.out.println(param);
		Member m = service.selectOneMember(param);
		System.out.println("testtest : " + m);
		new Gson().toJson(m == null ? "true" : "false", out);
	}

	@RequestMapping("/member/searchIdPwPage.do")
	public String searchIdPwPage() {
		return "member/searchIdPwPage";
	}

	@RequestMapping("/member/searchIdPwPage2.do")
	public String searchIdpage2() {
		return "member/searchIdPage";
	}

	@RequestMapping("/member/searchIdPwPage3.do")
	public String searchPwpage2() {
		return "member/searchPwPage";
	}

	@RequestMapping("/member/searchId.do")
	public String searchId1(String memberName, String memberPhone, Member m, Model model) {

		m.getMemberName();
		m.getMemberPhone();
		System.out.println(m);
		Member m2 = service.searchId1(m);

		String msg = "";
		String loc = "";

		if (m2 == null) {
			msg = "해당하는 데이터가 없습니다.";
			loc = "/member/searchIdPwPage.do";
		} else {
			msg = "검색완료";
			loc = "/member/resultIdPage.do?m2=" + m2.getMemberId();
		}
		model.addAttribute("m2", m2);

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/member/searchId2.do")
	public String searchId2(String memberName, String memberEmail, Model model, Member m) {

		m.getMemberName();
		m.getMemberEmail();

		Member m2 = service.searchId2(m);

		String msg = "";
		String loc = "";
		System.out.println(m2);
		if (m2 == null) {
			msg = "해당하는 데이터가 없습니다.";
			loc = "/member/searchIdPwPage.do";
		} else {
			msg = "검색완료";
			loc = "/member/resultIdPage.do?m2=" + m2.getMemberId();

//			이메일 전송 메소드 호출 후 전송된 코드와 회원 ID 저장
			model.addAttribute("code", this.checkEmail(memberEmail));
			model.addAttribute("m2", m2.getMemberId());

//			인증 창 화면으로 이동
			return "member/checkEmail";
		}
		model.addAttribute("m2", m2);

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/member/resultIdPage.do")
	public String resultIdPage(String m2, Model model) {

		model.addAttribute("m2", m2);

		return "member/resultIdPage";
	}

	@RequestMapping("/member/searchPw.do")
	public String searchPw(String memberId, String memberName, String memberPhone, Model model, Member m) {
		m.getMemberId();
		m.getMemberName();
		m.getMemberPhone();

		// 일단 아이디, 이름과 휴대전화로 회원이 맞는지 확인
		Member m3 = service.searchId3(m);

		String msg = "";
		String loc = "";

		if (m3 == null) {
			msg = "해당하는 데이터가 없습니다.";
			loc = "/member/searchIdPwPage.do";
		} else {
			// 회원이 임시 패스워드 생성창으로 바로가기
			msg = "비밀번호를 재 생성 하세요";
			loc = "/member/updatePwPage.do?m3=" + m3.getMemberId();
		}
		model.addAttribute("m3", m3);

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";

	}

	@RequestMapping("/member/searchPw2.do")
	public String searchPw2(String memberId, String memberName, String memberEmail, Model model, Member m) {
		m.getMemberId();
		m.getMemberName();
		m.getMemberEmail();

		// 일단 아이디, 이름과 이메일로 회원이 맞는지 확인
		System.out.println(m);
		Member m3 = service.searchId4(m);
		System.out.println(m3);
		String msg = "";
		String loc = "";

		if (m3 == null) {
			msg = "해당하는 데이터가 없습니다.";
			loc = "/member/searchIdPwPage.do";
		} else {

			// 회원이 임시 패스워드 생성창으로 바로가기
			msg = "비밀번호를 재 생성 하세요";
			loc = "/member/updatePwPage.do?m3=" + m3.getMemberId();

//			이메일 전송 메소드 호출 후 전송된 코드와 회원 ID저장
			model.addAttribute("code", this.checkEmail(memberEmail));
			model.addAttribute("m3", m3.getMemberId());

//			인증 창 화면으로 이동
			return "member/checkEmail";
		}

		model.addAttribute("m3", m3);

		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";

	}

	@RequestMapping("/member/updatePwPage.do")
	public String updatePwPage(String m3, Model model) {

		model.addAttribute("memberId", m3);
		return "member/updatePwPage";
	}

	@RequestMapping("/member/memberUpdatePw.do")
	public ModelAndView updateMemberPw(ModelAndView mv, Member m, String memberPw) {

		m.setMemberPw(pwEncoder.encode(memberPw));
		int resultPw = service.updateMemberPw(m);
		// mv.setViewName("/member/resultIdPage2.do?resultPw="+resultPw);

		String msg = "";
		String loc = "";

		if (resultPw > 0) {
			msg = "비밀번호가 정상적으로 변경되었습니다.";
			loc = "/member/resultIdPage2.do?resultPw=" + resultPw;
			System.out.println(resultPw);
		} else {
			msg = "비밀번호가 변경 실패";
			loc = "/member/searchIdPwPage.do";
			System.out.println(resultPw);
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);

		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/member/resultIdPage2.do")
	public String resultPwPage(String resultPw, Model model) {

		model.addAttribute("resultPw", resultPw);
		model.addAttribute("myroom", "y");
		return "member/resultIdPage";
	}

//	마이룸 메인연결
	@RequestMapping("/member/myroom/main.do")
	public ModelAndView myroomMain(ModelAndView mv, @SessionAttribute("loginMember") Member m) {

		Map param = new HashMap();
		param.put("memberId", m.getMemberId());
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		for (int i = 1; i < 5; i++) {

			c.set(year, month - i, 1);
			int lastDay = c.getActualMaximum(Calendar.DATE);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//			System.out.println(dateFormat.format(c.getTime()));
			param.put("start" + i, dateFormat.format(c.getTime()));
			c.set(year, month - i, lastDay);
//			System.out.println(dateFormat.format(c.getTime()));
			param.put("finish" + i, dateFormat.format(c.getTime()));
		}
		List<Integer> list = service.getPaidAmount(param);
//		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("myroom/main");

		return mv;
	}

//	회원등급별 혜택 페이지
	@RequestMapping("/member/grade.do")
	public String memberGrade(Model m) {

		List<Membergrade> mg = service.memberGrade();
		m.addAttribute("allMembergrade", mg);
		List<Couponlist> cl = service.couponlist();
		System.out.println(cl);
		m.addAttribute("allCouponlist", cl);

		return "member/memberGrade";
	}

	@RequestMapping("/member/sleepingMemberPage.do")
	public String sleepingMemberPage() {
		return "member/sleepingMemberPage";
	}

//	다음달 등급 페이지
	@RequestMapping("/member/myroom/nextGrade.do")
	public String nextGrade() {

		return "member/nextGrade";
	}

//	쿠폰함 페이지
	@RequestMapping("/member/myroom/coupon.do")
	public String couponBox(Model m) {

		List<Membergrade> mg = service.memberGrade();
		m.addAttribute("allMembergrade", mg);
		m.addAttribute("pageBar", PageFactory.getOwnPageBar(10, 1, 5, "adMemberPage.do"));

		return "myroom/couponBox";
	}

//	회원정보수정 페이지
	@RequestMapping("/member/myroom/updateMember.do")
	public String updateMember() {

		return "myroom/updateMember";
	}

//	이메일 인증
	@ResponseBody
	@RequestMapping("/member/checkEmail.do")
	public String checkEmail(String memberEmail) {

//		난수생성 코드
//		출처: https://cofs.tistory.com/266 [CofS]
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 5; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String code = new String(temp);

////		이메일 정보 설정
//		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
//
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				// TODO Auto-generated method stub
//
//				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
//				helper.setFrom("문곰책방<21pm_moonbook@naver.com>");
//				helper.setTo(memberEmail);
//				helper.setSubject("<문곰책방>이메일 인증을 위한 코드 발송");
//				helper.setText(
//						"안녕하세요. 문곰책방입니다.<br><br>이메일 주소 인증을 위한 인증코드입니다.<br><br>이메일 주소 인증코드 : <br><br><span style='font-weight:900; font-size:30px;'>"
//								+ code + "</span>",
//						true);
//			}
//		};
//
////		이메일 송신
//		mailSender.send(preparator);

		return code;
	}

//	회원정보수정전 재로그인창
	@RequestMapping("/member/myroom/reLogin.do")
	public String reLogin() {

		return "myroom/reLogin";
	}

//	회원정보수정
	@RequestMapping("/member/myroom/updateMemberEnd.do")
	public ModelAndView memberUpdateEnd(Member m, ModelAndView mv) {

		int result = service.updateMemberEnd(m);
		if (result > 0) {
			mv.addObject("msg", "수정 완료");
		} else {
			mv.addObject("msg", "잘못된 시도입니다. 여러번 같은 증상이 반복될 경우 관리자에게 문의해주세요.");
		}
		mv.addObject("loc", "/member/myroom/main.do");
		mv.setViewName("common/msg");

		return mv;
	}

//	회원 비밀번호 수정
	@RequestMapping("/member/myroom/changePw.do")
	public String changePw(int del, Model m) {

//		del 값이 0보다 크면 이메일 인증 후 회원탈퇴 로직
		if (del > 0) {
//			del값 전송
			m.addAttribute("del", del);
		}

//		그 외에는 이메일 인증 후 비밀번호 변경 화면으로 이동
		return "myroom/changePw";
	}

//	회원 삭제
	@RequestMapping("/member/myroom/deleteMember.do")
	public ModelAndView deleteMember(Member m, ModelAndView mv) {

		int result = service.deleteMember(m);
		String loc = "";
		String msg = "";
		if (result > 0) {
			msg = "정상적으로 탈퇴 되셨습니다. 그 동안 문곰 책방을 이용해 주셔서 감사합니다.";
			loc = "/member/logout.do";
		} else {
			msg = "예기치 못 한 에러가 발생했습니다. 이와 같은 현상이 반복되면 관리자에게 문의하십시오.";
			loc = "/member/myroom/main.do";
		}
		mv.setViewName("common/msg");
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);

		return mv;
	}

//	결제 내역 리스트
	@RequestMapping("/member/myroom/payList.do")
	public ModelAndView payList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, HttpSession session,
			String searchType, Date startDate, Date finishDate, ModelAndView mv) {

		Member m = (Member) session.getAttribute("loginMember");
		Map<String, String> param = new HashMap();
		if (searchType == null || searchType.equals("")) {

			Date date = new Date();
			long uni = (long) date.getTime() / 1000;
			param.put("finishDate", "" + uni);
			long startYear = uni - (60 * 60 * 24 * 365);
			param.put("startDate", "" + startYear);
		}
		param.put("memberId", (String) m.getMemberId());
		int totalData = service.bookPurchaseCount(param);
		List<Order> list = service.bookPurchaseList(param, cPage, numPerpage);
		String pageBar = PageFactory.getOwnPageBar(totalData, cPage, numPerpage, "payList.do");
		mv.addObject("list", list);
		List date = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			String tm = ((Payment) list.get(i)).getPayAt() + "000";
			long millis = Long.parseLong(tm);
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(millis);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
			date.add("" + dateFormat.format(cal.getTime()));

		}

		mv.addObject("date", date);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("myroom/payList");

		return mv;
	}

//	이북 결제 내역 리스트
	@RequestMapping("/member/myroom/ebookPayList.do")
	@ResponseBody
	public Map ebookPayList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, String searchType, Date startDate,
			Date finishDate, HttpSession session, ModelAndView mv) {

		Member m = (Member) session.getAttribute("loginMember");
		Map<String, Object> param = new HashMap();
		Date date = new Date();
		long uni = (long) date.getTime() / 1000;
		param.put("finishDate", "" + uni);
		long startYear = uni - (60 * 60 * 24 * 365);
		param.put("startDate", "" + startYear);
		param.put("memberId", (String) m.getMemberId());
		int totalData = service.ebookPurchaseCount(param);
		List<Order> list = service.ebookPurchaseList(param, cPage, numPerpage);
		String pageBar = PageFactory.getOwnPageBarAjax(totalData, cPage, numPerpage, "ebookPayList.do", 0);
		List dateList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			String tm = ((Payment) list.get(i)).getPayAt() + "000";
			long millis = Long.parseLong(tm);
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(millis);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
			dateList.add("" + dateFormat.format(cal.getTime()));

		}
		param.put("date", dateList);
		param.put("list", list);
		param.put("pageBar", pageBar);

		return param;
	}

//	기프트 결제 내역 리스트
	@RequestMapping("/member/myroom/giftPayList.do")
	@ResponseBody
	public Map giftPayList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage, String searchType, Date startDate,
			Date finishDate, HttpSession session, ModelAndView mv) {

		Member m = (Member) session.getAttribute("loginMember");
		Map<String, Object> param = new HashMap();
		Date date = new Date();
		long uni = (long) date.getTime() / 1000;
		param.put("finishDate", "" + uni);
		long startYear = uni - (60 * 60 * 24 * 365);
		param.put("startDate", "" + startYear);
		param.put("memberId", (String) m.getMemberId());
		int totalData = service.giftPurchaseCount(param);
		List<Order> list = service.giftPurchaseList(param, cPage, numPerpage);
		String pageBar = PageFactory.getOwnPageBarAjax(totalData, cPage, numPerpage, "giftPayList.do", 1);
		List dateList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			String tm = ((Payment) list.get(i)).getPayAt() + "000";
			long millis = Long.parseLong(tm);
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(millis);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
			dateList.add("" + dateFormat.format(cal.getTime()));

		}
		param.put("date", dateList);
		param.put("list", list);
		param.put("pageBar", pageBar);

		return param;
	}
}
