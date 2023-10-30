package com.choongang.s202350103.ybService;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybDao.MemberDaoImpl1;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl1 implements MemberService {
	private final MemberDaoImpl1 md;

	@Override
	public Member login(Member member) {
		System.out.println("MemberServiceImpl login Start");
		member = md.login(member);
		
		return member;
	}


}
