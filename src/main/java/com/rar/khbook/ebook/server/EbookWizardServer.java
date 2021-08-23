package com.rar.khbook.ebook.server;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.rar.khbook.ebook.model.service.EbookService;
import com.rar.khbook.member.model.vo.Member;

@Controller
public class EbookWizardServer extends TextWebSocketHandler{

	@Autowired
	EbookService service;
	
	private Map<String, WebSocketSession> clients = new HashMap();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished: " + session);
		
		String userId = getId(session);
		
		clients.put(userId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception {
		System.out.println("handleTextMessage: " + session + " / " + message);
		System.out.println(message.getPayload());
		
		String[] messageArr = message.getPayload().split(",");
		
		if (messageArr[0].equals("join")) {
			HashMap map = service.checkAuthority(messageArr[2]);
			
			System.out.println("join : " + map);
			
			String leader = (String)map.get("LEADER");
			
			Set keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String key = itr.next();
				
				if (key.equals(leader)) {
					Map<String, String> param = new HashMap();
					
					param.put("memberId", leader);
					param.put("message", message.getPayload());
					
					try {
						service.saveMessage(param);
					} catch(Exception e) {
						e.printStackTrace();
					}
					
					clients.get(key).sendMessage(new TextMessage(message.getPayload()));
				}
			}
		}
		
		if (messageArr[0].equals("tada")) {
			String memberId = messageArr[1];
			
			List<HashMap> clubList = service.showMyClubList(memberId);
			String[] clubArr = new String[clubList.size()];
			
			for (int i = 0; i < clubList.size(); i++) {
				clubArr[i] = (String)clubList.get(i).get("CLUB_NAME");
			}
			
			Set<String> targetMemberSet = new HashSet();
			
			for (String clubName : clubArr) {
				List<HashMap> list = service.showClubInfo(clubName);
				
				for (int i = 0; i < list.size(); i++) {
					targetMemberSet.add((String)list.get(i).get("MEMBER_ID"));
				}
			}
			
			Iterator<String> itrTargetMember = targetMemberSet.iterator();
			
			while (itrTargetMember.hasNext()) {
				String nextMember = itrTargetMember.next();
				
				Set keySet = clients.keySet();
				Iterator<String> itrKeySet = keySet.iterator();
				
				while (itrKeySet.hasNext()) {
					String nextKey = itrKeySet.next();
					
					if (nextKey.equals(nextMember)) {
						System.out.println("inner test");
						clients.get(nextKey).sendMessage(new TextMessage(message.getPayload()));
					}
				}
			}
			
		}
		
		if (messageArr[0].equals("admit")) {
			String memberId = messageArr[1];
			
			Map<String, String> param = new HashMap();
			param.put("memberId", memberId);
			param.put("message", message.getPayload());
			
			try {
				service.saveMessage(param);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			Set<String> keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String nextMember = itr.next();
				if (nextMember.equals(memberId)) {
					clients.get(nextMember).sendMessage(new TextMessage(message.getPayload()));
				}
			}
		}
		
		if (messageArr[0].equals("reject")) {
			String memberId = messageArr[1];
			
			Map<String, String> param = new HashMap();
			param.put("memberId", memberId);
			param.put("message", message.getPayload());
			
			try {
				service.saveMessage(param);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			Set<String> keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String nextMember = itr.next();
				if (nextMember.equals(memberId)) {
					clients.get(nextMember).sendMessage(new TextMessage(message.getPayload()));
				}
			}
		}
		
		if (messageArr[0].equals("deport")) {
			String memberId = messageArr[1];
			
			Map<String, String> param = new HashMap();
			param.put("memberId", memberId);
			param.put("message", message.getPayload());
			
			try {
				service.saveMessage(param);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			Set<String> keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String nextMember = itr.next();
				if (nextMember.equals(memberId)) {
					clients.get(nextMember).sendMessage(new TextMessage(message.getPayload()));
				}
			}
		}
		
		if (messageArr[0].equals("debate")) {
			String loginMemberId = messageArr[1];
			String clubName = messageArr[2];
			String debate = messageArr[3];
			
			Set<String> keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String nextMember = itr.next();
				clients.get(nextMember).sendMessage(new TextMessage(message.getPayload()));
			}
		}
		
		if (messageArr[0].equals("change")) {
			String clubName = messageArr[1];
			
			Set<String> keySet = clients.keySet();
			Iterator<String> itr = keySet.iterator();
			
			while (itr.hasNext()) {
				String nextMember = itr.next();
				clients.get(nextMember).sendMessage(new TextMessage(message.getPayload()));
			}
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
		System.out.println("afterConnectionClosed: " + session + " / " + status);
		
		String userId = getId(session);
		
		clients.remove(userId);
	}
	
}
