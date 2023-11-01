package com.choongang.s202350103.model;

import java.util.Date;
import lombok.Data;

@Data
public class Member {				// 회원
		private int 	m_num;		// 회원 번호
		private String 	m_id;		// 회원 아이디
		private String 	m_name;		// 회원 이름
		private String	m_pw;		// 회원 비밀번호
		private String 	m_ph;		// 회원 전화번호
		private String	m_addr;		// 회원 주소 
		private String 	m_email;	// 회원 이메일
		private String 	m_birth; 	// 회원 생일
		private Date 	m_date;		// 회원 가입일
		private int	 	m_point;	// 회원 포인트
		private int 	m_admin;	// 관리자 여부
		private int 	m_wd;		// 탈퇴자 여부 
		private String  m_image;	// 회원 이미지
		
		// 조회 및 join 용
		private String m_reid; 		// 추천인 ID 
		
}
