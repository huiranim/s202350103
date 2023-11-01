package com.choongang.s202350103.ybService;


import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybDao.MemberDao;
import com.choongang.s202350103.ybDao.MemberDaoImpl1;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl1 implements MemberService {
	private final MemberDao md;
	

	@Override
	public Member login(Member member1) {
		System.out.println("MemberServiceImpl login Start");
		member1 = md.login(member1);
		
		return member1;
	}
	
	@Override
	public boolean emailCheck(String m_name, String email) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("m_name", m_name);
	    map.put("email", email);
	    String result = md.emailCheck(map);
	    if("1".equals(result)) {
	        return true;
	    }
	    return false;
	}
	 
	 
	@Override
	public boolean phoneCheck(String m_name, String phone) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("m_name", m_name);
	    map.put("phone", phone);
	    System.out.println(map);
	    String result = md.phoneCheck(map);
	    if("1".equals(result)) {
	        return true;
	    }
	    return false;
	}


	

}
