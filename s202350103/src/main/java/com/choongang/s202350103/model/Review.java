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
	
	//조회용
	private String pageNum;
	private int    startRow;		private int endRow;
}
