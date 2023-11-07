package com.choongang.s202350103.yjDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.MemberQ;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao{

	private final SqlSession session;
	
	// 아이디 중복검사 
	@Override
	public int idConfirm(String m_id) {
		int resultId = session.selectOne("resultId",m_id);
		return resultId;
	}
	// 회원 가입 
	@Override
	public int joinResult(Member member) {
		int joinResult = session.insert("joinResult",member);
		return joinResult;
	}
	// 추천인 포인트 적립
	@Override
	public int memberJoinPoint(String m_reid) {
		int	memberJoinPoint = session.update("memberJoinPoint", m_reid);
		return memberJoinPoint;
	}
	// 회원 상세 
	@Override
	public Member memberInfo(int m_num) {
		Member member = session.selectOne("memberInfo",m_num);
		return member;
	}
	// 회원 정보 수정
	@Override
	public int memberUpdate(Member  member) {
		int memberUpdate = session.update("memberUpdate", member);
		return memberUpdate;
	}
	// 회원 번호 검증
	@Override
	public String memberPhFind(String m_ph) {
		String memberPhFind = session.selectOne("memberPhFind",m_ph);
		return memberPhFind;
	}
	// 인증 후 회원 상세
	@Override
	public Member memberFindGetId(String m_ph) {
		Member member = session.selectOne("memberFindGetId",m_ph);
		return member;
	}
	// 내 리뷰 리스트
	@Override
	public List<Member> memberMyReview(int m_num) {
		List<Member> memberMyReview = session.selectList("memberMyReview",m_num);
		return memberMyReview;
	}
	// 관리자 회원 전체 조회
	@Override
	public List<Member> adminMemberList(Member member) {
		List<Member> adminMemberList = session.selectList("adminMemberList",member);
		return adminMemberList;
	}
	// 내 주문 리스트
	@Override
	public List<Member> memberMyOrder(int m_num) {
		List<Member> memberMyOrder = session.selectList("memberMyOrder",m_num);
		return memberMyOrder;
	}
	// 전체 회원 카운트
	@Override
	public int totalMember() {
		int totalMember = session.selectOne("totalMember");
		return totalMember;
		
	}
	// 회원 이메일 검증
	@Override
	public String memberEmailFind(String m_email) {
		String memberEmailFind = session.selectOne("memberEmailFind",m_email);
		return memberEmailFind;
	}
	// 이메일 인증후 회원정보 상세 
	@Override
	public Member memberFindGetIdEmail(String m_email) {
		Member member = session.selectOne("memberFindGetIdEmail",m_email);
		return member;
	}
	// 회원 등록
	@Override
	public int memberQInsert(MemberQ memberQ) {
		int memberQInsert = session.insert("memberQInsert",memberQ);
		return memberQInsert;
	}
	// 문의 리스츠
	@Override
	public List<MemberQ> memberQnaList() {
		List<MemberQ> memberQnaList = session.selectList("memberQnaList");
		return memberQnaList;
	}

}
