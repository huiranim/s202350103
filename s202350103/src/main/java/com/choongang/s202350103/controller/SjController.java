package com.choongang.s202350103.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.sjService.OldbookService;
import com.choongang.s202350103.sjService.Paging;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SjController {

	private final OldbookService obs;
	
	@GetMapping(value = "BolistOb")
	public String listOb(OldBook oldBook, String currentPage, Model model) {
		
		System.out.println("SjController Start ");
		
		int totalOb = obs.totalOb();
		//Paging 작업
		Paging  page = new Paging(totalOb, currentPage);
		
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		
		List<OldBook> listOb = obs.listOb(oldBook);
		
		
		model.addAttribute("totalOb", totalOb);
		model.addAttribute("listOb" , listOb);
		model.addAttribute("page" , page);
		
		return "/sj/boOldBookList";
		
	}
	
	
	@GetMapping(value = "BodetailOb")
	public String detailOb (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());

		model.addAttribute("oldBook",oldBook);
		
		return "/sj/boOldBookDetailList";
	
	}
	
	@GetMapping(value = "BoupdateObDetailCheck")//updateFormEmp
	public String updateFormOb(int ob_num, Model model) {
		System.out.println("sjController Start updateForm..." );
		
		OldBook oldBook = obs.detailOb(ob_num);
		
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
	  
//	    String ob_write_date = "";
//		if (oldBook.getOb_write_date() != null) {
//			ob_write_date = oldBook.getOb_write_date().substring(0, 10);
//			oldBook.setOb_write_date(ob_write_date);
//		}
//		System.out.println("ob_write_date->"+ob_write_date);

	    // 문제 
		// 1. DTO  String hiredate
		// 2.View : 단순조회 OK ,JSP에서 input type="date" 문제 발생
		// 3.해결책  : 년월일만 짤라 넣어 주어야 함 
	    
		model.addAttribute("oldBook",oldBook);
		return "/sj/boOldBookCheck";

	}
		
	
	
	
	
	@PostMapping(value="updateOb")
	public String updateOb(OldBook oldBook, Model model) {
        log.info("updateOb Start...");

		int updateCount = obs.updateOb(oldBook);
		System.out.println("sjController oldBook.get->"+oldBook.getOb_num());
		System.out.println("sjController oldBook.getOb_report_date->"+oldBook.getOb_report_date());
		System.out.println("sjController oldBook.getOb_status->"+oldBook.getOb_status());
		System.out.println("sjController oldBook.getOb_ripped->"+oldBook.getOb_ripped());
		System.out.println("sjController oldBook.getOb_scribble->"+oldBook.getOb_scribble());
		System.out.println("sjController oldBook.getOb_smeary->"+oldBook.getOb_smeary());
		System.out.println("sjController oldBook.getOb_grade->"+oldBook.getOb_grade());
		System.out.println("sjController oldBook.getOb_pur_price->"+oldBook.getOb_pur_price());
		
		System.out.println("SjController updateCount-->"+updateCount);
		model.addAttribute("uptCnt",updateCount);    // Test Controller간 Data 전달
		model.addAttribute("oldBook",oldBook);
//		model.addAttribute("kk3","Message Test");    // Test Controller간 Data 전달
   		return "forward:boOldBookList";   
   		//return "redirect:boOldBookCheck";   
	}

	
	
		
	}
	


