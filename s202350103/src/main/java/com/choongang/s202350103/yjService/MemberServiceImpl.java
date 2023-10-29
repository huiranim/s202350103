package com.choongang.s202350103.yjService;

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

	
}
