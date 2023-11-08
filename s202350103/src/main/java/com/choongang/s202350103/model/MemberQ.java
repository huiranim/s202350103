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
	
	
	// 조회용
	private String 	m_id;		// 회원 아이디
	private String 	m_name;		// 회원 이름
	private String	m_addr;		// 회원 주소 
	private String 	m_email;	// 회원 이메일
	private String  m_image;	// 회원 이미지
	private int 	m_admin;	// 관리자 여부
	
	// 페이징 
	private String  pageNum;		
	private int     start;		
	private int 	end;
	
}
