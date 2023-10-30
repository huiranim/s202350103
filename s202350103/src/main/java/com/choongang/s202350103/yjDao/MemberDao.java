package com.choongang.s202350103.yjDao;

import com.choongang.s202350103.model.Member;

public interface MemberDao {
	
	// 아이디 중복 검사 
	int idConfirm(String m_id);
	// 회원가입
	int joinResult(Member member);
	// 추천인 포인트 적립
	int memberJoinPoint(String m_reid);
	
}
