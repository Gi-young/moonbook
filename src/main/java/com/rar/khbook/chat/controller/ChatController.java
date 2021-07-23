package com.rar.khbook.chat.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rar.khbook.chat.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat/add")
	public String showAdd() {
		return "chat/add";
	}
	
	@RequestMapping("/chat/doAdd")
	@ResponseBody
	public String doAdd(@RequestParam Map<String, Object> param) {
		Map<String,Object> rs=chatService.doAdd(param);
		int id = (int)rs.get("id");
		
		return id+"번 채팅방이 생성되었습니다.";
	}
	
}
