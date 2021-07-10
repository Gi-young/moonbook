package com.rar.khbook.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.rar.khbook.member.model.vo.Member;

public class LoginCheckInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) {
		HttpSession session=request.getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
		if(loginMember!=null) {
			return true;
		}else {
			request.setAttribute("msg","로그인 후 이용해주세요");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/msg.do");
			return false;
		}
	}
	
}
