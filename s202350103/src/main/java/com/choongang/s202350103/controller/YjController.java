package com.choongang.s202350103.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.yjService.MemberService;

import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Controller
public class YjController {

	private final MemberService ms;
	
	public YjController(MemberService ms) {
		this.ms = ms;
	}
	
	// 약관 페이지 이동
	@RequestMapping("/memberJoin")
	public String memberJoin() {
		return "yj/memberJoin";
	}
	
	// 회원 가입 폼 이동
	@RequestMapping("/memberJoinForm")
	public String memberJoinForm() {
		return "yj/memberJoinForm";
	}
	
	// 아이디 중복검사
	@GetMapping("/idConfirm")
	public String idConfirm(@RequestParam String m_id, Model model) {

		System.out.println("YjController m_id ->" + m_id);
		
		int resultId = ms.idConfirm(m_id);
		System.out.println(resultId);
		
		if(resultId > 0) {
			model.addAttribute("no","중복된 ID 입니다. 다시 입력해주세요.");
		}else {
			model.addAttribute("m_id",m_id);
			model.addAttribute("ok",m_id + " 는 사용 할 수 있는 ID 입니다.");
		}
		
		return "yj/memberJoinForm";
	}
	
	// 회원가입 
		// @RequestParam -> 특정 파라미터
		// @ModelAttribute -> 객체 바인딩 
		@PostMapping("/memberJoinAction")
		public String memberJoinAction(@RequestParam("m_email1") String m_email1, 
										@RequestParam("m_email") String m_email, 
										
										@RequestParam("m_ph1") String m_ph1,
										@RequestParam("m_ph2") String m_ph2,
										@RequestParam("m_ph3") String m_ph3,
										
										@RequestParam("m_birth") String m_birth,
										@RequestParam("m_birth1") String m_birth1,
										
										@RequestParam("m_addr1") String m_addr1,
										@RequestParam("m_addr2") String m_addr2,
										@RequestParam("m_addr") String m_addr,
										
										@ModelAttribute Member member, Model model) {

				
			
			System.out.println("memberJoinAction Start ...");
			
			member.setM_email(m_email1+"@"+m_email);	// 이메일 병합
			member.setM_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);	// 전화번호 병합
			member.setM_birth(m_birth+m_birth1);		// 생년월일 성별 병합
			member.setM_addr("("+m_addr1+")/"+ m_addr2 +"/"+ m_addr ); // 우편번호 주소 상세주소 병합
			
			
			String m_emailAll = member.getM_email();
			String m_phAll = member.getM_ph();
			String m_birthAll = member.getM_birth();
			String m_addrAll = member.getM_addr();
			
			System.out.println("m_emailAll ->"+ m_emailAll);
			System.out.println("m_phAll ->"+ m_phAll);
			System.out.println("m_birthAll ->" + m_birthAll);
			System.out.println("m_addrAll ->" + m_addrAll);
			
			// 추천인 입력시 포인트 적립 메서드 호출
			String m_reid = member.getM_reid();
			// 값이 null 이 아니거나 변수가 비어있지 않을 때 
			if (m_reid != null && !m_reid.isEmpty()) {
				
				memberJoinPoint(m_reid);
			}
			
			int joinResult = ms.joinResult(member);
			model.addAttribute("joinResult",joinResult);
			System.out.println("joinResult ->" + joinResult);
			
			return  "yj/memberJoinOk";
		}
	
	// 회원 가입시 추천인  포인트 적립
		@PostMapping("memberJoinPoint")
		public void memberJoinPoint(String m_reid) {
			int memberJoinPoint = ms.memberJoinPoint(m_reid);
		}
	
/*		
	// 마이 페이지 이동
		@RequestMapping ("/memberMyPage")
		public String memberMyPage(String m_num, Model model) {
			
			System.out.println(m_num);
			model.addAttribute("m_num",m_num);
			
			return "yj/memberMyPage";
		}
*/		
	
		
	// 내정보 상세
		@GetMapping("/memberMyInfo")
		public String memberMyInfo(int m_num, Model model) {
			
			Member member = ms.memberInfo(m_num);
			
			String[] splitPh = member.getM_ph().split("-");
			String[] splitEmail = member.getM_email().split("@");
			String[] splitAddr = member.getM_addr().split("/");
			
			model.addAttribute("splitPh",splitPh);
			model.addAttribute("splitEmail",splitEmail);
			model.addAttribute("splitAddr",splitAddr);
			
			model.addAttribute("member",member);
			
			return "yj/memberMyInfo";
		}
		
	// 회원정보 수정 
		@PostMapping("/memberUpdate")
		public String memberUpdate (	@RequestParam("m_num") int m_num ,
				
										@RequestParam("m_email1") String m_email1, 
										@RequestParam("m_email") String m_email, 
										
										@RequestParam("m_ph1") String m_ph1,
										@RequestParam("m_ph2") String m_ph2,
										@RequestParam("m_ph3") String m_ph3,
										
										@RequestParam("m_addr1") String m_addr1,
										@RequestParam("m_addr2") String m_addr2,
										@RequestParam("m_addr") String m_addr,
										
										@ModelAttribute Member member, Model model) {

			System.out.println(m_num);	
			
			member.setM_email(m_email1+"@"+m_email);	// 이메일 병합
			member.setM_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);	// 전화번호 병합
			member.setM_addr("("+m_addr1+")/"+ m_addr2 +"/"+ m_addr ); // 우편번호 주소 상세주소 병합
			
			
			String m_emailAll = member.getM_email();
			String m_phAll = member.getM_ph();
			String m_addrAll = member.getM_addr();
			
			System.out.println("m_emailAll ->"+ m_emailAll);
			System.out.println("m_phAll ->"+ m_phAll);
			System.out.println("m_addrAll -> " + m_addrAll);
			
			int memberUpdate = ms.memberUpdate(member);
			model.addAttribute("memberUpdate",memberUpdate);
		
			return  "redirect:/";
		}
		
		
		
}
