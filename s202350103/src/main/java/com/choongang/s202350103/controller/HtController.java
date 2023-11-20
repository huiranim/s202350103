package com.choongang.s202350103.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.LifecycleListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.htService.KakaoPay;
//import com.choongang.s202350103.htService.KakaoPay;
import com.choongang.s202350103.htService.OrderrService;
import com.choongang.s202350103.htService.Paging;
import com.choongang.s202350103.htService.ReviewService;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class HtController {
	private final OrderrService os;
	private final ReviewService rs;

	@Data
	@AllArgsConstructor
	class Result<T>{ 
		private final int plusEnd; //총 인원수 추가
		private final T data;
	}
	
	@ResponseBody 
	@RequestMapping("plusEnd")
	public Result endPlus(String plusEndStr, Review review) {
		int plusEnd = 5;
		System.out.println("plusEndStr--> "+plusEndStr);
		if (plusEndStr != null) plusEnd = Integer.parseInt(plusEndStr);
		review.setStart(1);
		review.setEnd(plusEnd);
		
		List<Review> listReview = rs.listReview(review);
		System.out.println("Review.size--> "+listReview.size());
		System.out.println("Review--> "+listReview);
		
		return new Result(plusEnd, listReview);
	}
	
	@RequestMapping("/reviewList")
	public String reviewList(Model model, Review review, HttpSession session,  Member member) {
		System.out.println("Controller Start reviewList...");
		
		
		// 임시 상품 등록(나중에 삭제)
		review.setNb_num(100042);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}

		int reviewTotal = rs.reviewTotal(review);
		double reviewAverage = rs.reviewAverage(review);

		review.setR_review_average(reviewAverage);
		review.setR_review_total(reviewTotal);

		for (int i = 1; i < 6; i++) {
			review.setR_rating(i);
			int reviewRatingCnt = rs.reviewRating(review);
			// 도서 리뷰 별점 평균
			switch (i) {
			case 1:
				review.setR_rating1((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 2:
				review.setR_rating2((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 3:
				review.setR_rating3((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 4:
				review.setR_rating4((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			case 5:
				review.setR_rating5((int) (((double) reviewRatingCnt / reviewTotal) * 100));
				break;
			}
		}

		if (review.getEnd() == 0) {
			review.setEnd(5);
		}
		System.out.println("Controller Start review.getStart->" + review.getStart());
		System.out.println("Controller Start review.getEnd->" + review.getEnd());

		List<Review> listReview = rs.listReview(review);
		
		model.addAttribute("member",member);
		model.addAttribute("listReview", listReview);
		model.addAttribute("review", review);
		// model.addAttribute("reviewTotal", reviewTotal);

		return "/ht/foProductReviewList";
	}

	 @GetMapping("/MyReviewList")
	 public String MyReviewList(Model model, Orderr orderr, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		
		orderr.setM_num(member.getM_num());
		
		// orderr 전체  Count ?
		int totalReviewCnt = rs.totalReviewCnt(orderr);
		System.out.println("totalReviewCnt--> " + totalReviewCnt);
		
		// Paging 작업
		Paging  page = new Paging(totalReviewCnt, currentPage);
		// Parameter orderr --> Page만 추가 setting
		orderr.setStart(page.getStart());    // 시작시 1
		orderr.setEnd(page.getEnd()); 		 // 시작시 5
		
		 
		List<Orderr> reviewWriteList = rs.reviewWriteList(orderr);
		System.out.println("HtController MyReviewList() reviewWriteList.size() --> "+ reviewWriteList.size());
		 
		model.addAttribute("page", page);
		model.addAttribute("reviewWriteList", reviewWriteList);
		model.addAttribute("member",member); 
		  
		return "/ht/foMyReviewList";
	}
	 
	 @GetMapping("/MyReviewedList")
	 public String MyReviewedList(Model model, Review review, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		review.setM_num(member.getM_num());
		 
		 // orderr 전체 Count ?
		 int totalReviewedCnt = rs.totalReviewedCnt(review);
		 System.out.println("totalReviewedCnt--> " + totalReviewedCnt);
		 System.out.println("currentPage--> " + currentPage);
		 
		 // Paging 작업 
		 Paging page = new Paging(totalReviewedCnt, currentPage);
		 //Parameter orderr --> Page만 추가 setting
		 System.out.println("Start--> " + page.getStart());
		 System.out.println("End--> " + page.getEnd());
		 review.setStart(page.getStart());//시작시 1 
		 review.setEnd(page.getEnd()); // 시작시 5
		 
		 review.setM_num(member.getM_num());
		 
		 
		 List<Review> reviewedWriteList = rs.reviewedWriteList(review);
		 System.out.println("HtController MyReviewList() reviewedWriteList.size() --> "+ reviewedWriteList.size());
		 
		 model.addAttribute("page", page);
		 model.addAttribute("reviewedWriteList", reviewedWriteList);
		 model.addAttribute("member",member);
		  
		 return "/ht/foMyReviewedList";
	}
	  
	 @RequestMapping("/reviewForm")
	 public String reviewForm(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewList...");
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		Review reviewOne = rs.reviewOne(review);
		
		model.addAttribute("member",member);
		model.addAttribute("review", review);
		model.addAttribute("reviewOne", reviewOne);
		
		return "/ht/foReviewWriteForm";
	}

	 @RequestMapping("/reviewWritePro")
	 public String reviewInsert(Model model, Review review, HttpSession session, Member member) {
		System.out.println("HtController reviewInsert Start...");
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewInsert(review);
		System.out.println("HtController reviewInsert result-->" + result);
		
		model.addAttribute("result", result);
		model.addAttribute("member",member);
		
		return "/ht/foReviewWritePro";
	}
	 
	 @RequestMapping("/reviewUpdateForm")
	 public String reviewUpdateForm(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewUpdateForm...");
		System.out.println("reviewUpdateForm review---> "  + review);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		//PK 이용한 Review 조회 로직 추가
		Review writedReview = rs.writedReview(review);
		writedReview.setCurrentPage(review.getCurrentPage());
		
		model.addAttribute("writedReview", writedReview);
		model.addAttribute("member",member);
		
		return "/ht/foReviewUpdateForm";
	}
	 
	 @RequestMapping("/reviewUpdatePro")
	 public String reviewUpdatePro(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewUpdateForm...");
		System.out.println("reviewUpdatePro review---> "  + review);
		
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewUpdate(review);
		
		System.out.println("result --> " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		model.addAttribute("member",member);
		
		return "/ht/foReviewUpdatePro";
	}
	 
	 @RequestMapping("/reviewDelete")
	 public String reviewDelete(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewDelete...");

		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewDelete(review);
		
		System.out.println("result --> " + result);
		
		model.addAttribute("result", result);
		model.addAttribute("review", review);
		model.addAttribute("member",member);
		
		return "/ht/foReviewDelete";
	}
	// 결제 폼
	 @RequestMapping("/orderForm")
	 public String orderForm(Model model, HttpSession session, Member member, NewBook newBook, Cart cart, int paymentType) {
		System.out.println("Controller Start orderForm ...");
		int totalPrice = 0;
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		String[] splitPh   = member.getM_ph().split("-");
		String[] splitAddr = member.getM_addr().split("/");
		
		System.out.println("newBook.getNb_num --> "+ newBook.getNb_num());
		System.out.println("paymentType--> "+ paymentType);
		
		
		
		// paymentType 1--> 바로결제, 2--> 장바구니 결제
		if (paymentType == 1) {
			// 바로 결제(1개)
			List<NewBook> orderOne = os.orderOne(newBook);
			System.out.println("HtController orderOne--->" + orderOne);
			for(NewBook newBook2 : orderOne ) {
				totalPrice += newBook2.getNb_price();
				newBook.setTotalPrice(totalPrice);
				if ( totalPrice > 50000) newBook.setO_deliv_price(0);
				else                     newBook.setO_deliv_price(3000);
			}
			
			model.addAttribute("orderList", orderOne);
			model.addAttribute("cart", newBook);
			model.addAttribute("paymentType", paymentType);
			System.out.println("HtController totalPrice--->" + totalPrice);

			
		} else if (paymentType == 2) {
			// 장바구니 결제(여러개)
			List<Cart> orderList = os.orderList(cart, member);
			System.out.println("HtController orderList kkk --->" + orderList);
			for(Cart cart1 : orderList ) {
				totalPrice += cart1.getNb_price();
			}
			cart.setTotalPrice(totalPrice);
			if ( totalPrice > 50000) cart.setO_deliv_price(0);
			else                     cart.setO_deliv_price(3000);
			
			model.addAttribute("orderList", orderList);
			model.addAttribute("cart", cart);
			System.out.println("HtController totalPrice--->" + totalPrice);
			System.out.println("HtController cart.getO_deliv_price())--->" + cart.getO_deliv_price());

		} 
		
		
		model.addAttribute("paymentType",paymentType);
		model.addAttribute("member",member);
		model.addAttribute("splitPh",splitPh);
		model.addAttribute("splitAddr",splitAddr);
		
		return "/ht/foOrderForm";
	}

	 
	 @RequestMapping("/orderAction")
	 public String orderAction(
			 
							 	 String m_email1, 
								 String m_email, 
	 
							     String m_ph1,
								 String m_ph2,
								 String m_ph3,
				 
				 				 String m_addr1,
								 String m_addr2,
								 String m_addr,
								 
								 int    destination, // 1-> 최근 배송지 / 2-> 배송지 직접 입력
								 int    paymentType, // 1-> 바로 결제   /  2-> 장바구니 결제
								 Model model, HttpSession session, Member member, Orderr orderr, Cart cart
								 ) {
		System.out.println("Controller orderAction Start...");
		System.out.println("Controller orderAction 1 paymentType-->"+paymentType);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		orderr.setM_num(member.getM_num());
		
		// 최근 주소지 = 1, 직접입력 = 2
		if(destination == 2) {
			orderr.setO_rec_addr("("+m_addr1+")/"+ m_addr2 +"/"+ m_addr );	// 우편번호 주소 상세주소 병합
			orderr.setO_rec_mail(m_email1+"@"+m_email);						// 이메일 병합
			orderr.setO_rec_ph(m_ph1+"-"+m_ph2+"-"+m_ph3);					// 전화번호 병합
			System.out.println("HtController orderAction orderr--> "+ orderr);
			System.out.println("HtController getO_rec_ph --> "+ orderr.getO_rec_ph());
			System.out.println("HtController o_rec_addr --> "+ orderr.getO_rec_addr());
		}
		
		System.out.println("HtController orderr-->"+orderr);
		
		System.out.println("Htcontroller orderAction 2 paymentType---> " + paymentType);
		
		List<Cart> list =  new ArrayList<Cart>();
		
		
		if(paymentType == 1) {
			cart.setM_num(member.getM_num());
			cart.setNb_num(orderr.getNb_num());
			cart.setC_count(1);
			list.add(cart);
			System.out.println("orderAction list--> " + list);
		} else if (paymentType == 2) {
			list = os.orderList(cart, member);

			System.out.println("orderAction list--> " + list);
		} 
		
		//Orderr 테이블 insert
		os.orderInsert(orderr, list); //프로시저를 사용하므로 return값이 없어도 된다. orderr DTO에 값을 가지고 나온다. DAO 참고
		System.out.println("HtController orderInsert() orderr.getO_order_num()-->"+orderr.getO_order_num());
		
		model.addAttribute("result_o_order_num", orderr.getO_order_num());
		model.addAttribute("member",member);
		
		return "/ht/foOrderForm";
	}

	// 카카오페이
	 @Setter(onMethod_ = @Autowired)
	 private KakaoPay kakaopay;  // Service

	 @RequestMapping("kakaoPayStart")
	 public String kakaoButton() {
		 System.out.println("kakaoPayStart-->");
		 return "/ht/kakaoPay";
	 }

	 @PostMapping("/kakaoPay")
	 public String kakaoPay() {
		 log.info("kakaoPay post............................................");
   
		 return "redirect:" + kakaopay.kakaoPayReady();
	 }
   
	 @GetMapping("/kakaoPaySuccess") // pg_token : 결제승인 요청을 인증하는 토큰 사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달
	 public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		 System.out.println("kakaoPaySuccess get............................................");
		 System.out.println("kakaoPaySuccess pg_token : " + pg_token);
	  
		 model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
		 
		 return "/ht/kakaoPaySuccess";
	 }
	 
}
