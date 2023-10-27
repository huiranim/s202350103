package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class WishList {		// 찜하기
	private int m_num; 		// 회원번호
	private int nb_num;		// 상품번호
	private int c_count;	// 찜여부
}
