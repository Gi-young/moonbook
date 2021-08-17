package com.rar.khbook.auction.server;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.rar.khbook.auction.model.service.AuctionService;
import com.rar.khbook.member.model.vo.Member;

@Controller
public class AuctionServer extends TextWebSocketHandler{

	@Autowired
	AuctionService service;
	
	private Map<String, WebSocketSession> clients = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished: " + session);
		
		String userId = getId(session);
		
		clients.put(userId, session);
		
		System.out.println("테스트 해보기"+clients);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage: " + session + " / " + message);
		
		String[] messageArr = message.getPayload().split(",");
		for(String s:messageArr) {
			System.out.println(s);
		}
	
		
		if (messageArr[0].equals("bid")) {
				Set keySet = clients.keySet();
				Iterator<String> itr = keySet.iterator();
			while (itr.hasNext()) {
				String userId = itr.next();
				
				clients.get(userId).sendMessage(new TextMessage(message.getPayload()));
				
			}
			
		}
		if(messageArr[0].equals("main")) {

			Set keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			while (itr.hasNext()) {
				String userId = itr.next();				
				clients.get(userId).sendMessage(new TextMessage(message.getPayload()));
			}
		}
	
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed: " + session + " / " + status);
		String userId = getId(session);
		clients.remove(userId);
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		
		Member loginMember = (Member)httpSession.get("loginMember");
		
		if (loginMember != null) {
			return loginMember.getMemberId();
		} else {
			return session.getId();
		}
	}
	
	
}
