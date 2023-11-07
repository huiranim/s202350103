package com.choongang.s202350103.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.LifecycleListener;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.htService.OrderrService;
import com.choongang.s202350103.htService.Paging;
import com.choongang.s202350103.htService.ReviewService;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.Orderr;
import com.choongang.s202350103.model.Review;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class HtController {
	private final OrderrService os;
	private final ReviewService rs;

	@RequestMapping("/orderTotal")
	public String test(Model model) {
		System.out.println("Controller Start...");
		int total = os.orderTotal();
		model.addAttribute("total", total);
		System.out.println("Controller test() orderTotal--> " + total);
		return "/ht/boOrderForm";
	}

	@RequestMapping("/reviewList")
	public String reviewList(Model model, Review review, HttpSession session,  Member member) {
		System.out.println("Controller Start reviewList...");
		
		// 임시 회원번호(나중에 삭제)
		member.setM_num(1002);
		session.setAttribute("member", member);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}

		int reviewTotal = rs.reviewTotal();
		double reviewAverage = rs.reviewAverage();

		review.setR_review_average(reviewAverage);
		review.setR_review_total(reviewTotal);

		for (int i = 1; i < 6; i++) {
			review.setR_rating(i);
			int reviewRatingCnt = rs.reviewRating(review);
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

		model.addAttribute("listReview", listReview);
		model.addAttribute("review", review);
		// model.addAttribute("reviewTotal", reviewTotal);

		return "/ht/boProductReviewList";
	}

	 @GetMapping("/MyReviewList")
	 public String MyReviewList(Model model, Orderr orderr, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		// 임시 회원번호(나중에 삭제)
		member.setM_num(1002);
		session.setAttribute("member", member);
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		 
		// orderr 전체  Count ?
		int totalReviewCnt = rs.totalReviewCnt(member);
		System.out.println("totalReviewCnt--> " + totalReviewCnt);
		
		// Paging 작업
		Paging  page = new Paging(totalReviewCnt, currentPage);
		// Parameter orderr --> Page만 추가 setting
		orderr.setStart(page.getStart());    // 시작시 1
		orderr.setEnd(page.getEnd()); 		 // 시작시 5
		
		orderr.setM_num(member.getM_num());
		 
		 List<Orderr> reviewWriteList = rs.reviewWriteList(orderr);
		 System.out.println("HtController MyReviewList() reviewWriteList.size() --> "+ reviewWriteList.size());
		 
		 model.addAttribute("page", page);
		 model.addAttribute("reviewWriteList", reviewWriteList);
		 
		  
		 return "/ht/boMyReviewList";
	}
	 
	 @GetMapping("/MyReviewedList")
	 public String MyReviewedList(Model model, Orderr orderr, String currentPage, HttpSession session, Member member) {
		 System.out.println("HtController MyReviewList Start...");
		
		// 임시 회원번호(나중에 삭제)
		member.setM_num(1002);
		session.setAttribute("member", member);
		 
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		 
		/*
		 * // orderr 전체 Count ? int totalReviewedCnt = rs.totalReviewedCnt(member);
		 * System.out.println("totalReviewedCnt--> " + totalReviewedCnt);
		 * 
		 * // Paging 작업 Paging page = new Paging(totalReviewedCnt, currentPage); //
		 * Parameter orderr --> Page만 추가 setting orderr.setStart(page.getStart()); //
		 * 시작시 1 orderr.setEnd(page.getEnd()); // 시작시 5
		 * 
		 * orderr.setM_num(member.getM_num());
		 */
		 
		 List<Orderr> reviewWriteList = rs.reviewWriteList(orderr);
		 System.out.println("HtController MyReviewList() reviewWriteList.size() --> "+ reviewWriteList.size());
		 
		 // model.addAttribute("page", page);
		 model.addAttribute("reviewWriteList", reviewWriteList);
		 
		  
		 return "/ht/boMyReviewList";
	}
	  
	 @RequestMapping("/reviewForm")
	 public String reviewForm(Model model, HttpSession session, Member member, Review review) {
		System.out.println("Controller Start reviewList...");
		
		// 임시 회원번호(나중에 삭제)
		member.setM_num(1002);
		session.setAttribute("member", member);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		model.addAttribute("review", review);
		
		return "/ht/boReviewWriteForm";
	}

	 @RequestMapping("/reviewWritePro")
	 public String reviewInsert(Model model, Review review, HttpSession session, Member member) {
		System.out.println("HtController reviewInsert Start...");
		
		// 임시 회원번호(나중에 삭제)
		member.setM_num(1002);
		session.setAttribute("member", member);
		
		// 로그인한 멤버 값 불러오기
		member =(Member) session.getAttribute("member");
		
		if(member == null) {
			return "yb/loginForm";
		}
		
		int result = rs.reviewInsert(review);
		System.out.println("HtController reviewInsert result-->" + result);
		
		model.addAttribute("result", result);
		
		return "/ht/boReviewWritePro";
	}
}
