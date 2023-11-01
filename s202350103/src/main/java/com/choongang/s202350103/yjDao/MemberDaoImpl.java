package com.choongang.s202350103.yjDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;

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

}
