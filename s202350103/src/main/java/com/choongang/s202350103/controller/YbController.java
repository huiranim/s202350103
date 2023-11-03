package com.choongang.s202350103.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.WishList;
import com.choongang.s202350103.ybService.MemberService;
import com.choongang.s202350103.ybService.Paging;

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
	public String login(Member member1, HttpSession session, HttpServletRequest request, Model model,
						@RequestParam("m_id") String m_id) {
		log.info("Login page");
		ModelAndView mv = new ModelAndView();
		System.out.println("YbController login() session -> " + session);
		Member member = ms.login(member1);
		
		if (member != null) {
			session.setAttribute("member", member);
			System.out.println("YbController login() session -> " + session.getId());
			
			return "redirect:/";
		} else {
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
					  System.out.println("YbController logout() session null ");
					  session.removeAttribute("member"); session.invalidate(); // 세션 초기화
				  }
		  } catch (Exception e) {
	         System.out.println("logout Exception -> "+e.getMessage());
	      }
	      return "redirect:/";
	   }
	
	// 마이페이지 이동
	@GetMapping(value = "memberMyPage1")
	public String memberMyPage1() {
		System.out.println("YbController memberMyPage1() start...");
		
		return "yb/memberMyPage1";
	}
	// 비밀번호 찾기 페이지 이동
	@GetMapping(value = "memberFindPwForm")
	public String findMemberPw() {
		System.out.println("YbController memberFindPwForm() start...");
		return "yb/memberFindPwForm";
	}
	// 장바구니 페이지 이동
	@RequestMapping(value = "memberCartList")
	public String memberCartList(Cart cart, Model model, String currentPage, 
								 HttpSession session, Member member) {
		System.out.println("YbController memberCartList() start...");
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
	
		System.out.println("YbController memberCartList() member.m_id -> " + member.getM_id());
		// 회원별 장바구니 총 개수
		int totalCart = ms.totalCart(member);
		System.out.println("YbController memberCartList() totalCart -> " + totalCart);
		
		// 페이징 처리
		Paging page = new Paging(totalCart, currentPage);
		
		cart.setStart(page.getStart());
		cart.setEnd(page.getEnd());
		
		System.out.println("YbController memberCartList member.m_num -> " + member.getM_num());
		// 장바구니 리스트
		List<Cart> listCart = ms.listCart(cart, member);
		System.out.println("YbController memberCartList listCart.size() -> " + listCart.size());
		
		int totalPrice = ms.totalPrice(member);
		model.addAttribute("totalCart", totalCart);
		model.addAttribute("member", member);
		model.addAttribute("listCart", listCart);
		model.addAttribute("totalPrice", totalPrice);
		
		return "yb/memberCartList";
	}
	
	// 찜목록 페이지 이동
	@RequestMapping(value = "memberWishList")
	public String memberWishList(Member member, HttpServletRequest request, HttpSession session, Model model, 
								 WishList wishList, String currentPage) {
		
		System.out.println("YbController memberWishList() start...");
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		// 회원별 찜 총 개수
		int totalWishList = ms.totalWishList(member);
		
		// 페이징 처리
		Paging page = new Paging(totalWishList, currentPage);
				
		wishList.setStart(page.getStart());
		wishList.setEnd(page.getEnd());
		
		System.out.println("YbController memberCartList() member.m_id -> " + member.getM_id());
	
		
		// 찜목록 리스트
		List<WishList> memberWishList = ms.memberWishList(wishList);
		System.out.println("YbController memberCartList listCart.size() -> " + memberWishList.size());
		System.out.println("YbController memberCartList listCart.title -> " + wishList.getNb_title());
		model.addAttribute("member", member);
		model.addAttribute("memberWishList", memberWishList);
		model.addAttribute("totalWishList", totalWishList);
		model.addAttribute("wishList", wishList);
		return "yb/memberWishList";
	}
	
	// 회원 탈퇴 페이지 이동
	@GetMapping(value = "memberWithdrowForm")
	public String memberWithdrawForm(Member member, HttpSession session, Model model) {
		
		System.out.println("YbController memberWithdrowForm() start...");
		
		member =(Member) session.getAttribute("member");
		if(member == null) {
			return "yb/loginForm";
		}
		
		
		model.addAttribute("member", member);
		return "yb/memberWithdrawForm";
	}
	
	// 회원탈퇴 하기
	@PostMapping(value = "memberWithdrow")
	public String memberWithdraw(Member member, HttpSession session, Model model
								,@RequestParam("m_pw") String m_pw) {
		
		System.out.println("YbController memberWithdraw() start...");
		member =(Member) session.getAttribute("member");

		if(m_pw == member.getM_pw()) {
			int result = ms.memberWithdraw(member);
			return "yb/memberWithdrowForm";
		} else {
			return "yb/memberWithdrowForm";
		}
	}

   @ResponseBody
   @RequestMapping("/memberChkPw")
   public String memberChkPw(Member member, HttpSession session) {
         System.out.println("YbController memberChkPw() start..");
         member =(Member) session.getAttribute("member");
         
         String memberPw = member.getM_pw();
         System.out.println("YbController memberChkPw() memberPw -> " + memberPw);
         return memberPw;
   }	
	

}
	

	   


