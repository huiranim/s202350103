package com.choongang.s202350103.model;

import lombok.Data;

@Data
public class Cart {			// 장바구니
	private int m_num; 		// 회원번호
	private int nb_num;		// 상품번호
	private int c_count;	// 상품개수
}
