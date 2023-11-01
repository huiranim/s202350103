package com.choongang.s202350103.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybService.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class YbController {

	private final MemberService ms;
	// Main Page
	@RequestMapping(value = "/")
	public String main() {
		System.out.println("YbController main() start... ");
		return "main";
	}
	// 로그인 창 이동
	@GetMapping(value = "loginForm")
	public String loginForm() {
		System.out.println("YbController login() start... ");
		return "yb/loginForm";
	}
	// 로그인
	@RequestMapping(value = "memberLogin")
	public String login(Member member1, HttpSession session, HttpServletRequest request, Model model) {
		log.info("Login page");
		ModelAndView mv = new ModelAndView();
		System.out.println("YbController login() session -> " + session);
		Member member = ms.login(member1);
		

		if (member != null) {
			session.setAttribute("member", member);
			System.out.println("YbController login() session -> " + session.getId());
			return "redirect:/";
		} else {
			// 로그인실패
			mv.addObject("msg", "로그인 실패");
			return "yb/loginForm";
		}
	}
	
	// 로그아웃
	@GetMapping(value = "memberLogout")
	   public String logout(HttpSession session, HttpServletRequest request) {
			System.out.println("YbController userLogout start... ");
	      try {
				
				  session = request.getSession(false); //세션이 있으면 기존 세션을 반환한다.
				  // 세션이 없으면 새로운  세션을 생성하지 않고, null을 반환
				  if (session != null) {
					  System.out.println("YbController logout session null ");
					  session.removeAttribute("member"); session.invalidate(); // 세션 초기화
				  }
		  } catch (Exception e) {
	         System.out.println("logout Exception -> "+e.getMessage());
	      }
	      return "redirect:/";
	   }
	
	@GetMapping(value = "memberMyPage1")
	public String memberMyPage1() {
		System.out.println("YbController memberMyPage1() start...");
		return "yb/memberMyPage1";
	}
	
	@GetMapping(value = "findMemberPw")
	public String findMemberPw() {
		System.out.println("YbController findMemberPw() start...");
		return "yb/findMemberPw";
	}
	
	
	
}
