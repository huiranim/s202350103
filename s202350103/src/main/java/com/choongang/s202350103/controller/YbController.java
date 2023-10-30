package com.choongang.s202350103.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybService.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class YbController {

	private final MemberService ms;
	
	@GetMapping(value = "loginForm")
	public String loginForm() {
		return "yb/loginForm";
	}
	
	@RequestMapping(value = "userLogin")
	public String login(Member member, HttpSession session, HttpServletRequest request) {
		log.info("Login page");
		
		session = request.getSession();
		Member member1 = ms.login(member);
		
		if(member1 != null) {
			session.setAttribute("member1", member1);
			return "redirect:/";
		}
		
		return "yb/loginForm";
	}
 
}
