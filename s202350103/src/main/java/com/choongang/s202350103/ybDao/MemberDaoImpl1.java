package com.choongang.s202350103.ybDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl1 implements MemberDao {
	private final SqlSession session;

	@Override
	public Member login(Member member) {
		System.out.println("MemberDaoImpl login Start...");
		Member member1 = null;
		 
		try {
			member1 = session.selectOne("ybUserLogin", member);
			System.out.println("MemberDaoImpl login member1 -> " + member1.getM_id());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return member1;
	}


}
