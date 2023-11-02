package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class Review {			  // 리뷰
	private long   o_order_num;   // 주문번호
	private int    nb_num;		  // 상품번호
	private String r_title;		  // 리뷰제목
	private String r_content;	  // 리뷰내용
	private Date   r_create_date; // 리뷰등록일
	private int    r_rating;	  // 별점
	
	// 조회용
	private int    start;		private int end;
	// 회원 table(Member)에서 회원이름 관련 컬럼
	private String 	m_name;
	// 상품 table(NewBook)에서 이미지
	private String nb_image;
    // r_rating 별점을 1~5까지 구분해서 받음(total개수 또는 평균값)
	private int    r_rating1;
	private int    r_rating2;
	private int    r_rating3;
	private int    r_rating4;
	private int    r_rating5;
}