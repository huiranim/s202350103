package com.choongang.s202350103.yjService;

import com.choongang.s202350103.model.Member;

public interface MemberService {
	
	// 아이디 중복검사 
	int idConfirm(String m_id);
	// 회원가입
	int joinResult(Member member);
	// 추천인 포인트적립
	int memberJoinPoint(String m_reid);

	
}
