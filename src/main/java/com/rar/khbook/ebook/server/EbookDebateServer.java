package com.rar.khbook.ebook.server;

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

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.member.model.vo.Member;

@Controller
public class EbookDebateServer extends TextWebSocketHandler{

	@Autowired
	EbookService service;
	
	private Map<String, WebSocketSession> clients = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablishe: " + session);
		
		String senderId = getId(session);
		
		clients.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handelTextMessage: " + session + " : " + message);
		
		Set keySet = clients.keySet();
		Iterator itr = keySet.iterator();
		
		while (itr.hasNext()) {
			WebSocketSession client = clients.get((String)itr.next());
			
			String senderId = getId(session);
			
			client.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
		}
		
		
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
		
	}
	
}
