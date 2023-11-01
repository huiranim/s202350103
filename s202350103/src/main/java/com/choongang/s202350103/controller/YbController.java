package com.choongang.s202350103.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybService.MailServiceImpl;
import com.choongang.s202350103.ybService.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class YbController {
	private final MailServiceImpl mailService;
	private final MemberService ms;
	private final JavaMailSender mailSender;
	
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
	
	// 비밀번호 찾기 페이지
	@GetMapping("/findPassword")
	public String findPassword() {
	    return "/findPassword";
	}
	
	// 5분동안 유저확인 세션생성 (인증완료 X)
	@PostMapping("/find/password/auth")
	public ResponseEntity<Object> authenticateUser(String m_name, HttpSession session) {
	    Map<String, Object> authStatus = new HashMap<>();
	    authStatus.put("m_name", m_name);
	    authStatus.put("status", false);
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("authStatus", authStatus);
	    return new ResponseEntity<Object>(m_name, HttpStatus.OK);
	}
	
	// 인증번호 보내기 페이지
	@GetMapping("/find/password/auth")
	public String auth(String m_name, HttpSession session) {
	    Map<String, Object> authStatus = (Map<String, Object>) session.getAttribute("authStatus");
	    if(authStatus == null || !m_name.equals(authStatus.get("m_name"))) {
	        return "redirect:/find/password";
	    }
	    
	    return "/auth";
	}
	
	// m_name의 이메일이 맞는지 확인
	@GetMapping("/find/password/emailCheck")
	public ResponseEntity<Boolean> emailCheck(String m_name, String email){
	    boolean emailCheck = ms.emailCheck(m_name, email);
	    return new ResponseEntity<Boolean>(emailCheck, HttpStatus.OK);
	}
	 
	 
	// m_name의 전화번호가 맞는지 확인
	@GetMapping("/find/password/phoneCheck")
	public ResponseEntity<Boolean> phoneCheck(String m_name, String phone) {
	    boolean phoneCheck = ms.phoneCheck(m_name, phone);
	    return new ResponseEntity<Boolean>(phoneCheck,HttpStatus.OK);
	}
	
	// 인증번호 보내기
	@PostMapping("/send/authNum")
	private ResponseEntity<String> authNum(String phone, String email, HttpSession session){
	    String authNum = "";
	    for(int i=0;i<6;i++) {
	        authNum += (int)(Math.random() * 10);
	    }
	    
	    System.out.println("인증번호 : " + authNum);
	    
	    // 전화번호로 인증번호 보내기 추가
	    if(phone != null) {
//				System.out.println("전화번호로 인증번호 보내기");
	 
	        
	        
	    // 이메일로 인증번호 보내기
	    } else if(email != null) {
//				System.out.println("이메일로 인증번호 보내기");
	        mailService.sendAuthNum(email, authNum);
	    }
	    
	    
	    Map<String, Object> authNumMap = new HashMap<>();
	    long createTime = System.currentTimeMillis(); // 인증번호 생성시간
	    long endTime = createTime + (300 *1000);	// 인증번호 만료시간
	    
	    authNumMap.put("createTime", createTime);
	    authNumMap.put("endTime", endTime);
	    authNumMap.put("authNum", authNum);
	    
	    session.setMaxInactiveInterval(300);
	    session.setAttribute("authNum", authNumMap);
	    
	    return new ResponseEntity<String>("인증번호가 전송되었습니다", HttpStatus.OK);
	}
	
	// 인증 완료 후
	@PostMapping("/auth/completion")
	public ResponseEntity<String> authCompletion(HttpSession session) {
	    Map<String, Object> authStatus = (Map<String, Object>) session.getAttribute("authStatus");
	    if(authStatus == null) {
	        return new ResponseEntity<String>("인증시간이 만료되었습니다", HttpStatus.BAD_REQUEST);
	    }
	    authStatus.put("status", true);
	    return new ResponseEntity<String>(HttpStatus.OK);
	}


}


