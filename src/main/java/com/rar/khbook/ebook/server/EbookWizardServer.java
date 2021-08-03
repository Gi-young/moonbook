package com.rar.khbook.ebook.server;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.rar.khbook.member.model.vo.Member;

public class EbookWizardServer extends TextWebSocketHandler{

	private Map<String, WebSocketSession> clients = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablisher: " + session);
		
		String userId = getId(session);
		
		clients.put(userId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception {
		System.out.println("handleTextMessage: " + session + " / " + message);
		
		
		
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
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed: " + session + " / " + status);
	}
	
}
