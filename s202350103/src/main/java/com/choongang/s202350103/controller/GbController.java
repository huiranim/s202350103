package com.choongang.s202350103.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choongang.s202350103.gbService.NewBookService;
import com.choongang.s202350103.gbService.Paging;
import com.choongang.s202350103.model.NewBook;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class GbController {
	
	private final NewBookService nbs;
	
	// 국내도서 리스트 조회
	@RequestMapping("innewbookList")
	public String selectInNewBookList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectInNewBookList start...");
		// 국내도서 총 개수
		int inNewbookCnt = nbs.selectInNewBookCnt();
		System.out.println("GbController selectInNewBookList inNewbookCnt -> "+inNewbookCnt);
		
		// 페이징 처리 작업
		Paging page = new Paging(inNewbookCnt, currentPage);
		// Parameter emp --> Page만 추가 Setting
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		
		// 국내도서 리스트
		List<NewBook> listInNewbook = nbs.selectInNewBookList(newbook);
		System.out.println("GbController selectInNewBookList listNewbook.size() -> "+listInNewbook.size());

		model.addAttribute("listInNewbook", listInNewbook);
		model.addAttribute("inNewbookCnt", inNewbookCnt);
		model.addAttribute("page", page);
		
		return "gb/foInNewbookList";
	}

}
