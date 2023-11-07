package com.choongang.s202350103.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberQ {

	
	private int m_num;			// 회원 번호
	private int mq_num;			// 회원 문의번호
	private String mq_title;	// 회원 문의 제목
	private String mq_content;	// 회원 문의 내용
	private Date mq_date;		// 회원 문의 작성일
	private int mq_hidden;		// 회원 문의 비밀글 여부
	
}
