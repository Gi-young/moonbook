package com.rar.khbook.ebook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.rar.khbook.member.model.vo.Member;

public class EbookShoppingBasketLoginCheckInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("shoppingBasketLoginCheck", "denied");
			request.getRequestDispatcher("/ebook/pageEbook.do").forward(request, response);
			return false;
		} else {
			return true;
		}
	}

}
