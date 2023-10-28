package com.choongang.s202350103.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class YjController {

//	private final MemberService ms;
	
	// 약관 페이지 이동
	@RequestMapping("memberJoin")
	public String memberJoin() {
		return "yj/memberJoin";
	}
	
	// 회원 가입 폼 이동
	@RequestMapping("memberJoinForm")
	public String memberJoinForm() {
		return "yj/memberJoinForm";
	}
	
	
	
}
