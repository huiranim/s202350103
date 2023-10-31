package com.choongang.s202350103.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.yjService.MemberService;

import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class YjController {

	private final MemberService ms;

	final DefaultMessageService messageService; // 문자전송 API
	
	
	public YjController(MemberService ms) {
		this.ms = ms;
		// 문자 전송 API 							API 키, API Secret Key
		this.messageService = NurigoApp.INSTANCE.initialize("NCSI4UORH4AWJGTE", "ZYW9R5J88TDYQ2855DNUH8ZTJZNEENPR", "https://api.coolsms.co.kr");
		   
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
	
	// 계정 찾기 화면 이동
		@RequestMapping("memberFindAccount")
		public String memberFindAccount() {
			return"yj/memberFindAccount";
		}
	
	// 아이디 찾기 화면 이동
		@RequestMapping("memberFrinId")
		public String memberFrinId() {
			return "yj/memberFrinId";
		}
		
	// 인증 화면 이동
		@RequestMapping("memberFindAc")
		public String memberPhFindId(@RequestParam("auth") String auth, Model model ) {
			
			if("ph".equals(auth)) {
				return "yj/memberFindAcPh";
			}else {
				return "yj/memberFindAcEmail";
			}
			
		}
	
	// 인증 랜덤번호 발송 메서드
	    private String ranCode() {
	    	Random random = new Random();
	    	int min = 100000;
	    	int max = 999999;
	    	
	    	int ranCode = random.nextInt((max - min) + 1) + min;
	    	
	    	return String.valueOf(ranCode);
	    }
		
		
     // 인증 메시지 발송 
	  @PostMapping("/memberAuthPhone") 
	  public String memberAuthPhone(@RequestParam String m_ph, Model model) {
			
		  System.out.println(m_ph);
		  
	      Message message = new Message();
		  
		  String ranCode = ranCode();
		  
		  
		  // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력. "-" 제외
		  message.setFrom(m_ph); 			// 발신번호 입력
		  message.setTo("01024846106"); 	// 수신번호 입력
		  // 한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가
		  message.setText("[(주)DADOK] ["+ranCode+"] 인증번호를 정확히 입력해주세요.");
		  
		  SingleMessageSentResponse response = this.messageService.sendOne(new
		  SingleMessageSendingRequest(message)); System.out.println(response);
		  
		  return "yj/memberFindAcPh"; 
		  
		  }

		
		
}
