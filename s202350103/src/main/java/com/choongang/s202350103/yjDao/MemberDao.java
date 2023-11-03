package com.choongang.s202350103.yjDao;

import java.util.List;

import com.choongang.s202350103.model.Member;

public interface MemberDao {
	
	// 아이디 중복 검사 
	int idConfirm(String m_id);
	// 회원가입
	int joinResult(Member member);
	// 추천인 포인트 적립
	int memberJoinPoint(String m_reid);
	// 회원 상세
	Member memberInfo(int m_num);
	// 회원 정보 수정
	int memberUpdate(Member member);
	// 회원 번호 검증
	String memberPhFind(String m_ph);
	// 인증 후 회원 상세
	Member memberFindGetId(String m_ph);
	// 내 리뷰 리스트
	List<Member> memberMyReview(int m_num);
	// 관리자 회원 전체 조회
	List<Member> adminMemberList(Member member);
	// 내 주문 리스트
	List<Member> memberMyOrder(int m_num);
	// 전체 회원 카운트 
	int totalMember();
	
}
