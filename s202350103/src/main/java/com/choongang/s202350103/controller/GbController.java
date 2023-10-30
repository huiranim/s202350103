package com.choongang.s202350103.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.s202350103.gbService.NewBookService;
import com.choongang.s202350103.gbService.Paging;
import com.choongang.s202350103.model.NewBook;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class GbController {
	
	private final NewBookService nbs;
	
	// 국내도서 전체 리스트 조회
	@RequestMapping("innewbookList")
	public String selectInNewBookList(NewBook newbook, String currentPage, String orderType, Model model) {
		System.out.println("GbController selectInNewBookList start...");
		// 국내도서 총 개수
		int inNewbookCnt = nbs.selectInNewBookCnt();
		System.out.println("GbController selectInNewBookList inNewbookCnt -> "+inNewbookCnt);
		
		// 페이징 처리 작업
		Paging page = new Paging(inNewbookCnt, currentPage);
		// Parameter emp --> Page만 추가 Setting
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		newbook.setOrderType(orderType);
		System.out.println("GbController orderType -> "+newbook.getOrderType());
		
		// 국내도서 리스트
		List<NewBook> listInNewbook = nbs.selectInNewBookList(newbook);
		System.out.println("GbController selectInNewBookList listNewbook.size() -> "+listInNewbook.size());

		model.addAttribute("listInNewbook", listInNewbook);
		model.addAttribute("inNewbookCnt", inNewbookCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "0");
		model.addAttribute("orderType", orderType);
		
		return "gb/foInNewbookList";
	}

	// 국내도서 경영/경제 리스트 조회
	@RequestMapping("innewbookEcoList")
	public String selectinnewbookEcoList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectinnewbookEcoList start...");
		// 국내 경영/경제 총 개수
		int ineconmyCnt = nbs.selectInNewBookEcoCnt();
		System.out.println("GbController selectinnewbookEcoList enconmyCnt -> "+ineconmyCnt);
		
		// 페이징 처리
		Paging page = new Paging(ineconmyCnt, currentPage);
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내 경영/경제 리스트
		List<NewBook> listInNewbookEco = nbs.selectInNewBookEcoList(newbook);
		System.out.println("GbController selectinnewbookEcoList listInNewbookEco.size() -> "+listInNewbookEco.size());
		
		model.addAttribute("listInNewbook", listInNewbookEco);
		model.addAttribute("inNewbookCnt", ineconmyCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "1");
		
		return "gb/foInNewbookList";
	}
	
	// 국내도서 과학 리스트 조회
	@RequestMapping("innewbookSciList")
	public String selectinnewbookSciList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectinnewbookSciList start...");
		// 국내 과학 총 개수
		int inscienceCnt = nbs.selectInNewBookSciCnt();
		System.out.println("GbController selectinnewbookSciList inscienceCnt -> "+inscienceCnt);
		
		// 페이징 처리
		Paging page = new Paging(inscienceCnt, currentPage);
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내 과학 리스트
		List<NewBook> listInNewbookSci = nbs.selectInNewBookSciList(newbook);
		System.out.println("GbController selectinnewbookSciList listInNewbookSci.size() -> "+listInNewbookSci.size());
		
		model.addAttribute("listInNewbook", listInNewbookSci);
		model.addAttribute("inNewbookCnt", inscienceCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "2");
		
		return "gb/foInNewbookList";
	}
	
	// 국내도서 소설 리스트 조회
	@RequestMapping("innewbookNovList")
	public String selectinnewbookNovList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectinnewbookNovList start...");
		// 국내 소설 총 개수
		int innovelCnt = nbs.selectInNewBookNovCnt();
		System.out.println("GbController selectinnewbookNovList innovelCnt -> "+innovelCnt);
		
		// 페이징 처리
		Paging page = new Paging(innovelCnt, currentPage);
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내 소설 리스트
		List<NewBook> listInNewbookNov = nbs.selectInNewBookNovList(newbook);
		System.out.println("GbController selectinnewbookNovList listInNewbookNov.size() -> "+listInNewbookNov.size());
		
		model.addAttribute("listInNewbook", listInNewbookNov);
		model.addAttribute("inNewbookCnt", innovelCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "3");
		
		return "gb/foInNewbookList";
	}
	
	// 국내도서 역사/문화 리스트 조회
	@RequestMapping("innewbookHisList")
	public String selectinnewbookHisList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectinnewbookHisList start...");
		// 국내 역사/문화 총 개수
		int inhistoryCnt = nbs.selectInNewBookHisCnt();
		System.out.println("GbController selectinnewbookHisList inhistoryCnt -> "+inhistoryCnt);
		
		// 페이징 처리
		Paging page = new Paging(inhistoryCnt, currentPage);
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내 역사/문화 리스트
		List<NewBook> listInNewbookHis = nbs.selectInNewBookHisList(newbook);
		System.out.println("GbController selectinnewbookHisList listInNewbookHis.size() -> "+listInNewbookHis.size());
		
		model.addAttribute("listInNewbook", listInNewbookHis);
		model.addAttribute("inNewbookCnt", inhistoryCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "4");
		
		return "gb/foInNewbookList";
	}
	
	// 국내도서 인문 리스트 조회
	@RequestMapping("innewbookHumList")
	public String selectinnewbookHumList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectinnewbookHumList start...");
		// 국내 인문 총 개수
		int inhumanCnt = nbs.selectInNewBookHumCnt();
		System.out.println("GbController selectinnewbookHumList inhumanCnt -> "+inhumanCnt);
		
		// 페이징 처리
		Paging page = new Paging(inhumanCnt, currentPage);
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내 인문 리스트
		List<NewBook> listInNewbookHum = nbs.selectInNewBookHumList(newbook);
		System.out.println("GbController selectinnewbookHumList listInNewbookHum.size() -> "+listInNewbookHum.size());
		
		model.addAttribute("listInNewbook", listInNewbookHum);
		model.addAttribute("inNewbookCnt", inhumanCnt);
		model.addAttribute("page", page);
		model.addAttribute("category", "5");
		
		return "gb/foInNewbookList";
	}
}
