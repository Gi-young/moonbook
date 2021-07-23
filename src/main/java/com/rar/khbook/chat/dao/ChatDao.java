package com.rar.khbook.chat.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatDao {

	public void add(Map<String, Object> param);


}
