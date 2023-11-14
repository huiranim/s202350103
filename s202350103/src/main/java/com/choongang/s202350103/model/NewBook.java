package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class NewBook {					// 새상품
	private int nb_num;					// 상품번호
	private String nb_title;			// 제목
	private String nb_summary;			// 줄거리
	private int nb_price;				// 가격
	private String nb_writer;			// 작가
	private String nb_publisher;		// 출판사
	private String nb_publi_date;		// 출간일
	private String nb_isbn;				// ISBN
	private int nb_page;				// 쪽수
	private String nb_size;				// 책 크기
	private int nb_category1;			// 카테고리1
	private int nb_category2;			// 카테고리2
	private String nb_image;			// 책 이미지
	private int nb_readcnt;				// 조회수
	private String nb_register_date;	// 등록일자
	
	// 조회용
	private int w_wish;				// 찜여부
	private int m_num;				// 회원번호
	private int hit_nb_num;			// 최대 조회수 상품번호
	private int same_obCnt;			// 동일한 중고도서 개수
	private int r_rating;			// 별점
	private int reviewCnt;			// 리뷰 개수 
	private int r_ratingAvg;		// 별점 평균
	private String orderType;		// 정렬기준
	private String search_keyword;	// 검색어
	private String search_type;		// 검색조건
	private String pageNum;			// 페이징번호
	private int start;				// 페이징 시작번호
	private int end;				// 페이징 종료번호
	private int paymentType = 1;    // 1-> 바로 결제, 2-> 장바구니 결제 
	
}
