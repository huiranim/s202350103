package com.choongang.s202350103.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

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
		model.addAttribute("total",total);
		System.out.println("Controller test() orderTotal--> " + total);
		return "/ht/boOrderForm";
	}
	
	@RequestMapping("/reviewList")
	public String reviewList(Model model, Review review, String currentPage) {
		System.out.println("Controller Start reviewList...");
		
		int totalReview = rs.reviewTotal();
		
		model.addAttribute("totalReview", totalReview);
		
		// Paging 작업
		Paging page = new Paging(totalReview, currentPage);
		// Parameter emp --> Page만 추가 setting
		review.setStart(page.getStart());      // 시작시 1
		review.setEnd(page.getEnd());	       // 시작시 10
		
		List<Review> listReview = rs.listReview(review);
		
		model.addAttribute("totalReview", totalReview);
		model.addAttribute("listReview", listReview);
		model.addAttribute("page", page);
		
		return "/ht/boProductReviewList";
	}
	
	
	@RequestMapping("/ajaxReviewList")
	public String ajaxReviewList(Model model, Review review, String currentPage) {
		System.out.println("Controller Start reviewList...");
		
		int totalReview = rs.reviewTotal();
		
		model.addAttribute("totalReview", totalReview);
		
		// Paging 작업
		Paging page = new Paging(totalReview, currentPage);
		// Parameter emp --> Page만 추가 setting
		review.setStart(page.getStart());      // 시작시 1
		review.setEnd(page.getEnd());	       // 시작시 10
		
		List<Review> listReview = rs.listReview(review);
		
		model.addAttribute("totalReview", totalReview);
		model.addAttribute("listReview", listReview);
		model.addAttribute("page", page);
		
		return "/ht/boProductReviewList";
	}
	
	@RequestMapping("/reviewForm")
	public String reviewForm(Model model) {
		System.out.println("Controller Start reviewList...");
		return "/ht/boReviewWriteForm";
	}
	
	@PostMapping("/reviewWritePro")
	public String reviewInsert(Model model, Review review) {
		System.out.println("HtController reviewInsert Start...");
		int result = rs.reviewInsert(review);
		System.out.println("HtController reviewInsert result-->" + result);
		return "/ht/boReviewWritePro";
	}
	
	/*
	 * @GetMapping("/MyReviewList") public String MyReviewList(Model model, Orderr
	 * orderr, String currentPage) {
	 * System.out.println("HtController MyReviewList Start...");
	 * 
	 * int totalReview = rs.reviewTotal();
	 * 
	 * model.addAttribute("totalReview", totalReview);
	 * 
	 * // Paging 작업 Paging page = new Paging(totalReview, currentPage); // Parameter
	 * emp --> Page만 추가 setting orderr.setStart(page.getStart()); // 시작시 1
	 * orderr.setEnd(page.getEnd()); // 시작시 10
	 * 
	 * List<Review> listReview = rs.listReview(orderr);
	 * 
	 * model.addAttribute("totalReview", totalReview);
	 * model.addAttribute("listReview", listReview); model.addAttribute("page",
	 * page);
	 * 
	 * 
	 * return "/ht/boMyReviewList"; }
	 */
	

}
