package com.rar.khbook.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.rar.khbook.coupon.model.vo.Couponlist;

//매퍼 빈 등록
@Mapper
public interface CouponlistMapper {

//	어노테이션으로 맵핑
	@Select("SELECT * FROM COUPONLIST LEFT JOIN MEMBERGRADE ON COUPONLIST_MEMBERGRADE_NO = MEMBERGRADE_NO")
	public List<Couponlist> couponlist();
}
