package com.choongang.s202350103.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybService.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class YbController {

	private final MemberService ms;
	
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}
	
	
	@GetMapping(value = "loginForm")
	public String loginForm() {
		return "yb/loginForm";
	}
	
	@RequestMapping(value = "userLogin", method = RequestMethod.POST)
	public String login(Member member1, HttpSession session, HttpServletRequest request) {
		log.info("Login page");
		

	    System.out.println("YbController login() session -> " + session);
		Member member = ms.login(member1);
		System.out.println("YbController login() session -> " + session.getId());
		
		if(member != null) {
			session.setAttribute("member", member);
			
			return "redirect:/";
		} else
			return "yb/loginForm";
	}
 
	   @GetMapping(value = "logout")
	   public String logout(HttpSession session, HttpServletRequest request) {
	      try {
	         session = request.getSession(false);
	          if (session != null) {
	              session.invalidate();
	          }
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      }
	       return "redirect:/";
	      }
	        
}
