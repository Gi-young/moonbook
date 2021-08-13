package com.rar.khbook.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.rar.khbook.member.model.vo.Member;

public class GSLLoginCheckInterceptor   implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session=request.getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
		if(loginMember!=null) {
			return true;
		}else {
//			response.setContentType("text/html; charset=euc-kr");
//			PrintWriter out = response.getWriter();
//			out.println("<script>window.close();</script>");
			request.setAttribute("msg","로그인 후 이용해주세요");
			/* request.setAttribute("loc","/"); */
			request.getRequestDispatcher("/WEB-INF/views/gift/msgShopList.jsp").forward(request, response);
			return false;
		}
	}
	
}
