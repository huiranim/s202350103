package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class Orderr {				// 주문
	private long   o_order_num;		// 주문번호
	private int	   m_num;			// 회원번호
	private Date   o_order_date;	// 주문일자
	private int	   o_status;		// 주문상태
	private int	   o_type;			// 주문유형
	private int	   o_pay_price;		// 결제금액
	private int	   o_pay_type;		// 결제수단
	private long   o_card_num;		// 카드번호
	private int	   o_deliv_price;	// 배송비
	private int	   o_point;			// 사용포인트
	private String o_rec_name;		// 수령_이름
	private String o_rec_email;		// 수령_이메일
	private String o_rec_ph;		// 수령_전화번호
	private String o_rec_addr;		// 수령_주소
	private String o_rec_msg;		// 수령_메시지
	private int	   o_deliv_com;		// 발송택배사
	private long   o_deliv_track;	// 발송송장번호
	
	// 조회용
	private String m_name;			// 회원 이름
	private String m_id;			// 회원 아이디
	private String m_ph;			// 회원 전화번호
	private int	   nb_num;			// 상품번호(신/중고)
	private int	   ob_num;			// 중고상품번호
	private int	   o_de_prodtype;	// 상품유형
	private String nb_title;		// 대표상품명(책 제목)
	private int    start;			// 페이지 내 시작 게시글 번호
	private int    end;				// 페이지 내 종료 게시글 번호
	private int	   o_order_count;	// 주문 수량
	private int    o_order_price;	// 상품 금액 합산

	
}