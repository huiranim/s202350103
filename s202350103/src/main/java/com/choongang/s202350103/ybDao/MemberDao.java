package com.choongang.s202350103.ybDao;

import java.util.Map;

import com.choongang.s202350103.model.Member;

public interface MemberDao {
	Member			 login(Member member1);
	String 			 emailCheck(Map<String, Object> map);
	String 			 phoneCheck(Map<String, Object> map);
}
