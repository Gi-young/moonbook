package com.rar.khbook.auction.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.rar.khbook.member.model.vo.Member;

public class LoginCheck implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("loginMember"));
		if(session.getAttribute("loginMember")==null) {		
			request.setAttribute("msg", "로그인 후 이용가능 페이지");
			request.setAttribute("log","/");
			request.getRequestDispatcher("/WEB-INF/views/common/openmsg.jsp").forward(request, response);
		}
				
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
