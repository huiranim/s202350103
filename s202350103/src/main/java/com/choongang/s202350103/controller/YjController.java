package com.choongang.s202350103.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.yjService.MemberService;
import com.choongang.s202350103.yjService.Paging;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class YjController {

	private final MemberService ms;

	final DefaultMessageService messageService; // 문자전송 API
	
	private final JavaMailSender mailSender;	// 메일 전송 객체
	
	
	public YjController(MemberService ms,JavaMailSender mailSender) {
		this.ms = ms;
		// 문자 전송 API 							API 키, API Secret Key
		this.messageService = NurigoApp.INSTANCE.initialize("NCSI4UORH4AWJGTE", "ZYW9R5J88TDYQ2855DNUH8ZTJZNEENPR", "https://api.coolsms.co.kr");
		
		// 메일 전송 객체
		this.mailSender = mailSender;
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
	
		
	// 마이 페이지 이동
		@RequestMapping ("/memberMyPage")
		public String memberMyPage(int m_num) {
			
			
			return "yj/memberMyPage";
		}
	
	
	
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
	
	// 회원정보 수정 -> 수정 후 로그아웃
	@PostMapping("/memberUpdate")
	public String memberUpdate (@RequestParam("m_num") int m_num ,

								@RequestParam("m_image") String m_image,
			
								@RequestParam("m_email1") String m_email1, 
								@RequestParam("m_email") String m_email, 
								
								@RequestParam("m_ph1") String m_ph1,
								@RequestParam("m_ph2") String m_ph2,
								@RequestParam("m_ph3") String m_ph3,
								
								@RequestParam("m_addr1") String m_addr1,
								@RequestParam("m_addr2") String m_addr2,
								@RequestParam("m_addr") String m_addr,
								
								@ModelAttribute Member member, Model model,
								HttpSession session) {
	
		System.out.println(m_num);	
		System.out.println(m_image);
		
		member.setM_email(m_email1+"@"+m_email);	// 이메일 병합
		member.setM_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);	// 전화번호 병합
		member.setM_addr(m_addr1+"/"+ m_addr2 +"/"+ m_addr ); // 우편번호 주소 상세주소 병합
		
		
		String m_emailAll = member.getM_email();
		String m_phAll = member.getM_ph();
		String m_addrAll = member.getM_addr();
		
		System.out.println("m_emailAll ->"+ m_emailAll);
		System.out.println("m_phAll ->"+ m_phAll);
		System.out.println("m_addrAll -> " + m_addrAll);
		
		int memberUpdate = ms.memberUpdate(member);
		model.addAttribute("memberUpdate",memberUpdate);
		
		session.invalidate(); // 세션 초기화
		
		return  "redirect:/loginForm";
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
    
    // 전화번호 하이픈 - 추가 	
	private String phoneHyphen(String m_ph) {
		
		StringBuilder phoneHyphen = new StringBuilder();
		
		int phLength = m_ph.length();
		for(int i = 0; i < phLength; i++) {
			// 전화번호의 마지막자리까지 인덱스 부여 
			char digit = m_ph.charAt(i);
			
			// 전화번호에 하이픈을 추가할 위치 
			if(i == 3 || i == 7) {
				phoneHyphen.append('-');
			}
			phoneHyphen.append(digit);
		}
		return phoneHyphen.toString();
	}
	    
	    
     // 인증 메시지 발송 
	  @PostMapping("/memberAuthPhone") 
	  public String memberAuthPhone(@RequestParam String m_ph,
			  						@ModelAttribute Member member,	
			  						Model model) {
		  
		  // 허이픈 추가 메서드 호출 
		  String phoneHyphen = phoneHyphen(m_ph);
		  System.out.println(phoneHyphen);
		  // 변환된 전화번호 찾기
		  String memberPhFind = ms.memberPhFind(phoneHyphen);
		  System.out.println("yjController memberPhFind -> " + memberPhFind);
		  
		  // DB 에 있는 전화번호와 일치 시 메시지 발송
		  if (phoneHyphen.equals(memberPhFind)) {
			  Message message = new Message();
			  // 랜덤코드 추가 메서드 호출 
			  String ranCode = ranCode();
			  System.out.println("yjController 전송된 코드 :" + ranCode);
			  
			  // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력. "-" 제외
			  message.setFrom("01024846106"); 			// 발신번호 입력
			  message.setTo(m_ph); 						// 수신번호 입력
			  // 한글 45자, 영자 90자 이하 입력되면 자동으로 SMS타입의 메시지가 추가
			  message.setText("[(주)DADOK] ["+ranCode+"] 인증번호를 정확히 입력해주세요.");
			  
			  SingleMessageSentResponse response = this.messageService.sendOne(new
					  SingleMessageSendingRequest(message)); System.out.println(response);
					  
			  model.addAttribute("okPh","발송된 인증번호를 입력해주세요.");
			  model.addAttribute("m_ph",m_ph);
			  model.addAttribute("ranCode",ranCode);
			  
			  return "yj/memberFindAcPh"; 

		  }else {
			  model.addAttribute("noPh","가입되지 않은 회원입니다.");
			  return "yj/memberFindAcPh"; 
		  }
	  }
	  
	  // 인증번호 일치 여부 , 일치시 회원정보 상세
	  @PostMapping("memberFindGetId")
	  public String memberFindGetId(@RequestParam String m_ph,
			  						@RequestParam String inputCode,
			  						@RequestParam String ranCode,
			  						Model model	, HttpSession session) {
		  System.out.println("입력코드 : " + inputCode);
		  System.out.println("전송코드 : " + ranCode);
		  
		  if(inputCode.equals(ranCode)) {
			  	
			  // 하이픈 추가 메서드
			  String phoneHyphen = phoneHyphen(m_ph);
			  
			  Member member = ms.memberFindGetId(phoneHyphen);
			  
			  // 전화번호 * 처리 -> 스트링 포맷
			  // 구현 예정
			  
			  // 가입일 처리 -> 데이트 포맷
			  Date m_date = member.getM_date();
			  SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
			  String formatM_date = dataFormat.format(m_date);
			  
			  model.addAttribute("formatM_date",formatM_date );
			  model.addAttribute("member",member);
			  session.invalidate();
			  return "yj/memberFindGetId"; 
			  
		  }else {
			  model.addAttribute("noAuth","인증번호가 일치하지 않습니다. 다시 진행해 주세요.");
			  return "yj/memberFindAcPh"; 
		  }
	  }
	  
	  
	  
	  
	// 이메일 인증  
	@RequestMapping("/memberAuthEmail")
	public String mailTransport(@RequestParam String m_email,  Model model) {
		System.out.println(m_email);
		
		// 입력받은 메일이 DB 에 저장되어있는 회원의 메일 주소 인지 체크
		String memberEmailFind = ms.memberEmailFind(m_email);
		
		// DB 에 존재하는 회원의 메일이라면 
		if(m_email.equals(memberEmailFind)) {
			System.out.println("email 일치");
		
			try {
			// 메일전송 표준 포맷 	
			MimeMessage message = mailSender.createMimeMessage();
			// 메일전송 객체 
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
			
			String setfrom = "960921@gmail.com";	// 보내는 사람 이메일 (생략시 오류)
			String tomail = memberEmailFind;   		// 받는 사람 이메일
			String title = "(주)DADOK 인증메일 발송";  	// 제목
			
			// 랜덤코드 메서드 호출하여 변수저장
			String ranCode = ranCode();
			
			messageHelper.setFrom(setfrom);    		// 보내는 사람 이메일 (생략시 오류)
			messageHelper.setTo(tomail);       		// 받는사람 이메일
			messageHelper.setSubject(title);   		// 메일제목 (생략 가능) -> 생략시 try 안걸어줘도됨
													
			// 메일 내용 -> 랜덤코드 호출
			messageHelper.setText(ranCode + "  : 인증번호를 정확히 입력해주세요."); 
			// 메일 전송
			mailSender.send(message);
			
			// 전송 후 
			// 메시지 , 입력한 값, 랜덤코드(인증번호) 저장 후 리턴
			model.addAttribute("okEmail","전송된 이메일을 확인해 주세요.");
			model.addAttribute("m_email",m_email);
			model.addAttribute("ranCode",ranCode);

			// 실패시 
			}catch (Exception e) {
				System.out.println("yjController Email Send Error");
			}
			
			return "yj/memberFindAcEmail";
		
		// 	존재하지 않은 메일주소 일시 
		}else {
			System.out.println("불 일치");
			model.addAttribute("noEmail","가입되지 않은 회원입니다.");
			return "yj/memberFindAcEmail";
		}
		
	}
	
	 // 이메일 인증번호 일치 여부 , 일치시 회원정보 상세
	  @PostMapping("memberFindGetIdEmail")
	  public String memberFindGetIdEmail(@RequestParam String m_email,
			  							@RequestParam String inputCode,
			  							@RequestParam String ranCode,
			  							Model model, HttpSession session) {
		  System.out.println("이메일 입력코드 : " + inputCode);
		  System.out.println("이메일 전송코드 : " + ranCode);
		  
		  if(inputCode.equals(ranCode)) {
			  
			  Member member = ms.memberFindGetIdEmail(m_email);
			  
			  // 전화번호 * 처리 -> 스트링 포맷
			  // 구현 예정
			  
			  // 가입일 처리 -> 데이트 포맷
			  Date m_date = member.getM_date();
			  SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
			  String formatM_date = dataFormat.format(m_date);
			  
			  model.addAttribute("formatM_date",formatM_date );
			  model.addAttribute("member",member);
			  session.invalidate();
			  return "yj/memberFindGetId"; 
			  
		  }else {
			  model.addAttribute("noAuth","인증번호가 일치하지 않습니다. 다시 진행해 주세요.");
			  return "yj/memberFindAcEmail"; 
		  }
	  }
	  
	
	  
	  // 내리뷰 리스트 조회 
	  @GetMapping("memberMyReview")
	  public String memberMyReview(@RequestParam int m_num , Model model) {
		  
		  System.out.println(m_num);
		  
		  List<Member> memberMyReview = ms.memberMyReview(m_num);
		  
 		  model.addAttribute("memberMyReview",memberMyReview);
 		  
		  return "yj/memberMyReview";
	  }
	  
	  // 내 주문 리스트
	  @GetMapping("memberMyOrder")
	  public String memberMyOrder(@RequestParam int m_num, Model model) {
		  
		  List<Member> memberMyOrder = ms.memberMyOrder(m_num);
		  
		  model.addAttribute("memberMyOrder",memberMyOrder);
		  
		  return "yj/memberMyOrder";
	  }
	  
	  // 관리자 회원 전체 조회
	  @GetMapping("adminMemberList")
	  public String adminMemberList(Member member, String currentPage, Model model ) {
		  // 전체회원 count
		  int totalMember = ms.totalMember();
		  
		  // 페이징
		  Paging page = new Paging(totalMember, currentPage);
		  member.setStart(page.getStart());
		  member.setEnd(page.getEnd());
		  
		  List<Member> adminMemberList = ms.adminMemberList(member);
		  
		  model.addAttribute("totalMember",totalMember);
		  model.addAttribute("adminMemberList", adminMemberList);
		  model.addAttribute("page", page);
		  
		  return "yj/adminMemberList";
	  }
	
	  // 관리자 페이지 이동
	  @RequestMapping("mainBo")
	  public String mainBo() {
		  return "common/mainBo";
	  }
	  
	 
	  // 이미지 리스트
	  public List<String> imageList(){
		  
		  List<String> imageUrl = new ArrayList<String>();
		  imageUrl.add("../assets/images/memberImage/1.jpg");
		  imageUrl.add("../assets/images/memberImage/2.jpg");
		  imageUrl.add("../assets/images/memberImage/3.jpg");
		  imageUrl.add("../assets/images/memberImage/4.jpg");
		  imageUrl.add("../assets/images/memberImage/5.jpg");
		  imageUrl.add("../assets/images/memberImage/6.jpg");
		  imageUrl.add("../assets/images/memberImage/7.jpg");
		  imageUrl.add("../assets/images/memberImage/8.jpg");
		  imageUrl.add("../assets/images/memberImage/9.jpg");
		  imageUrl.add("../assets/images/memberImage/10.jpg");
		  imageUrl.add("../assets/images/memberImage/11.jpg");
		  imageUrl.add("../assets/images/memberImage/12.jpg");
		  imageUrl.add("../assets/images/memberImage/13.jpg");
		  imageUrl.add("../assets/images/memberImage/14.jpg");
		  imageUrl.add("../assets/images/memberImage/15.jpg");
		  imageUrl.add("../assets/images/memberImage/16.jpg");
		  imageUrl.add("../assets/images/memberImage/17.jpg");
		  imageUrl.add("../assets/images/memberImage/18.jpg");
		  
		  return imageUrl;
	  }
	  
	  
	  // 회원 상세정보 이미지 수정
	  @RequestMapping("/memberImageSelect")
	  public String memberImageSelect(Model model) {
		  
		  List<String> imageList = imageList();
		  model.addAttribute("imageList",imageList);
		  
		  return "yj/memberImageSelect";
	  }
	  
	  
	  @RequestMapping("kakao")
	  public String kakao() {
		  
		  return "yj/kakao";
	  }
	  
	  @PostMapping("paytest")
	  public String pay() {
		  
		  
		  return "yj/paytest";
	  }
	  
}
