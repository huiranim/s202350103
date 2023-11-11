package com.choongang.s202350103.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "test")
	public String test(Model model) {
		
		
		return "sj/test";
	}
	
	
	
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
		
		return "sj/boOldBookList";
		
	}
	
	
	@GetMapping(value = "BodetailOb")
	public String detailOb (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/boOldBookDetailList";
	
	}
	
	@GetMapping(value = "BoupdateObDetailCheck")//updateFormEmp
	public String updateFormOb(int ob_num, Model model) {
		System.out.println("sjController Start updateForm..." );
		
		OldBook oldBook = obs.detailOb(ob_num);
		
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());

		model.addAttribute("oldBook",oldBook);
		return "sj/boOldBookCheck";

	}

	//BO
	@PostMapping(value="updateOb")
	public String updateOb(OldBook oldBook, Model model) {
        log.info("updateOb Start...");

		int updateCount = obs.updateOb(oldBook);
		System.out.println("sjController oldBook.getOb_num()->"+oldBook.getOb_num());
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
   		//return "forward:boOldBookList";   
   		return "redirect:BolistOb";   
	}
	
	@RequestMapping(value = "writeFormObReport" ,method = RequestMethod.GET )
	public String writeFormObReport(OldBook oldBook,Model model) {
		System.out.println("sjController writeFormObReport start...");
		
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		
		return "sj/foObReport";
	}
	
	@RequestMapping(value = "writeFormObCal" ,method = RequestMethod.POST )
	public String writeFormObCal(OldBook oldBook,Model model) {
		System.out.println("sjController writeFormObCal start...");
		
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		System.out.println("sjController writeFormObCal oldbookList.size()->"+oldbookList.size());
		
		return "sj/foObCalcul";
	}
	
	@RequestMapping(value = "writeFormObTrans" , method = RequestMethod.POST )
	public String writeFormObTrans(OldBook oldBook, Model model) {
		System.out.println("sjController writeFormObTrans start...");
		
		List<OldBook> oldbookList = obs.oldBookAcc();
		model.addAttribute("oldBookAcc",oldbookList);
		System.out.println("sjController writeFormObTrans oldBook.getOb_acc_num()->"+oldBook.getOb_acc_num());
		System.out.println("sjController writeFormObTrans oldBook.getOb_acc_name()->"+oldBook.getOb_acc_name());
		System.out.println("sjController writeFormObTrans oldBook.getOb_report_date()->"+oldBook.getOb_report_date());
		System.out.println("sjController writeFormObTrans oldBook.getOb_num()->"+oldBook.getOb_num());
		System.out.println("sjController writeFormObTrans oldBook.getOb_trans_com()->"+oldBook.getOb_trans_com());
		System.out.println("sjController writeFormObTrans oldBook.getOb_trans_num()->"+oldBook.getOb_trans_num());
		
		return "sj/foObTrans";
	}
	
	/*
	 * @RequestMapping(value = "writeFormComple" ,method = RequestMethod.GET )
	 * public String writeFormObComple(OldBook oldBook, Model model) {
	 * System.out.println("sjController writeFormObComple start...");
	 * 
	 * List<OldBook> oldbookList = obs.oldBookAcc();
	 * model.addAttribute("oldBookAcc",oldbookList);
	 * System.out.println("sjController writeFormObComple oldbookList.size()->"
	 * +oldbookList.size()); System.out.
	 * println("sjController writeFormObTrans oldBook.getOb_trans_com()->"+oldBook.
	 * getOb_trans_com()); System.out.
	 * println("sjController writeFormObTrans oldBook.getOb_trans_num()->"+oldBook.
	 * getOb_trans_num());
	 * 
	 * 
	 * 
	 * return "sj/foObComple"; }
	 */
	
	@PostMapping(value = "writeOb")
	public String writeOb(OldBook oldBook, Model model) {
		System.out.println("sjController start writeOb...");
		
		int insertResult = obs.insertOldBook(oldBook);
		System.out.println("sjController oldBook->"+oldBook);
		System.out.println("insertResult"+insertResult);
		
		if (insertResult > 0) return "sj/foObComple";
		else {
			model.addAttribute("msg" , "입력실패 확인해보세요");
			return "sj/foObTrans";
	
		}
	}
	
	@GetMapping(value = "ModalList")
	public String listMoOb(OldBook oldBook,String currentPage, Model model) {
		
		System.out.println("SjController Start ");
		
		int totalOb = obs.totalOb();
		//Paging 작업
		Paging  page = new Paging(totalOb, currentPage);
		
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		
		List<OldBook> listMoOb = obs.listMoOb(oldBook);
		model.addAttribute("listMoOb" , listMoOb);
		model.addAttribute("totalOb", totalOb);
		model.addAttribute("page" , page);
		
		
		
		return "sj/foModalList";
		
	}
	@GetMapping(value = "ModetailNb")
	public String ModetailNb (int nb_num, Model model) {
		System.out.println("SjController Start ModetailNb...");
		
		OldBook oldBook = obs.ModetailNb(nb_num);
		System.out.println("SjController OldBook ModetailNb->"+oldBook);
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foObReport";
	
	}
	
	@GetMapping(value = "FodetailOb")
	public String detailObFo (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foObDetail";
	}
	
	@GetMapping(value = "folistOb")
	public String folistOb(OldBook oldBook, String currentPage, Model model) {
		
		System.out.println("SjController Start ");
		
		int totalOb2 = obs.totalOb2();
		//Paging 작업
		Paging  page = new Paging(totalOb2, currentPage);
		
		oldBook.setStart(page.getStart());
		oldBook.setEnd(page.getEnd());
		
		List<OldBook> OblistFo = obs.listObFo(oldBook);
		
		
		model.addAttribute("totalOb2", totalOb2);
		model.addAttribute("listObFo" , OblistFo);
		model.addAttribute("page" , page);
		
		return "sj/foInObList";
		
	}
	
	@GetMapping(value = "foOldBookDetail")
	public String foOldBookDetail (int ob_num, Model model) {
		System.out.println("SjController Start detailOb...");
		
		OldBook oldBook = obs.detailOb(ob_num);
		System.out.println("SjController detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		System.out.println("SjController detailOb ob_ripped()->"+oldBook.getOb_ripped());
		System.out.println("SjController detailOb ob_scribble()->"+oldBook.getOb_scribble());
		System.out.println("SjController detailOb ob_smeary()->"+oldBook.getOb_smeary());
	
		
		model.addAttribute("oldBook",oldBook);
		
		return "sj/foOldBookDetail";
	
	}
	
	//용빈 정산받기 버튼 컨트롤러
	@PostMapping(value = "foObUpComple")
	public String FoupdateObComple(OldBook oldBook, Model model) {
        log.info("FoupdateObComple Start...");
	
        
        int updateCount = obs.updateObComp(oldBook);
    	System.out.println("SjController updateCount-->"+updateCount);
		model.addAttribute("uptCnt",updateCount);    // Test Controller간 Data 전달
		model.addAttribute("oldBook",oldBook);
		
   		return "redirect:folistOb";    
	}
	@RequestMapping(value = "index")
	public String main22(Model model) {
		
		
		return "common/mainBo";
	}
	
	
}
	
	
	
	


