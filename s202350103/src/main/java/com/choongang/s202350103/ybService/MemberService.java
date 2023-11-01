package com.choongang.s202350103.ybService;

import com.choongang.s202350103.model.Member;

public interface MemberService {

	Member			login(Member member1);

	boolean 		emailCheck(String m_name, String email);

	boolean 		phoneCheck(String m_name, String phone);


}
	