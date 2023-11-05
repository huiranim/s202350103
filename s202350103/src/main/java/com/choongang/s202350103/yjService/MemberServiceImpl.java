package com.choongang.s202350103.yjService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.yjDao.MemberDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberDao md;
	
	// 아이디 중복검사
	@Override
	public int idConfirm(String m_id) {
		int resultId = md.idConfirm(m_id);
		return resultId;
	}
	// 회원가입
	@Override
	public int joinResult(Member member) {
		int joinResult = md.joinResult(member);
		return joinResult;
	}
	// 추천인 포인트 적립
	@Override
	public int memberJoinPoint(String m_reid) {
		int memberJoinPoint = md.memberJoinPoint(m_reid);
		return memberJoinPoint;
	}
	// 내정보 상세
	@Override
	public Member memberInfo(int m_num) {
		Member member = md.memberInfo(m_num);
		return member;
	}
	// 회원정보 수정
	@Override
	public int memberUpdate(Member member) {
		int memberUpdate = md.memberUpdate(member);
		return memberUpdate;
	}
	// 회원 번호 검증
	@Override
	public String memberPhFind(String m_ph) {
		String memberPhFind = md.memberPhFind(m_ph);
		return memberPhFind;
	}
	// 인증 후 회원상세
	@Override
	public Member memberFindGetId(String m_ph) {
		Member member = md.memberFindGetId(m_ph);
		return member;
	}
	// 내 리뷰 리스트
	@Override
	public List<Member> memberMyReview(int m_num) {
		List<Member> memberMyReview = md.memberMyReview(m_num);
		return memberMyReview;
	}
	// 관리자 회원 전체 조회
	@Override
	public List<Member> adminMemberList(Member member) {
		List<Member> adminMemberList = md.adminMemberList(member);
		return adminMemberList;
	}
	// 내 주문 리스트
	@Override
	public List<Member> memberMyOrder(int m_num) {
		List<Member> memberMyOrder = md.memberMyOrder(m_num);
		return memberMyOrder;
	}
	// 전체 회원 카운트
	@Override
	public int totalMember() {
		int totalMember = md.totalMember();
		return totalMember;
	}

	
}