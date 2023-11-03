package com.choongang.s202350103.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping("/bo")
	public String bomain() {
		System.out.println("GbController main() start... ");
		return "bomain";
	}
	
	// 국내도서 전체 리스트 조회
	@RequestMapping("innewbookList")
	public String selectInNewBookList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectInNewBookList start...");
		
		// 정렬 유형, 초기값(null)이면 --> recently
		String orderType_default = "recently";
		if( newbook.getOrderType() == null ) {
			newbook.setOrderType(orderType_default);
		}
		
		// 국내도서 총 개수
		int inNewbookCnt = nbs.selectInNewBookCnt(newbook.getNb_category2()); // 카테고리별 총 개수를 구해준다.
		System.out.println("GbController selectInNewBookList inNewbookCnt -> "+inNewbookCnt);
		
		// 페이징 처리 작업
		Paging page = new Paging(inNewbookCnt, currentPage);
		// Parameter newbook --> Page만 추가 Setting
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		System.out.println("GbController orderType -> "+newbook.getOrderType());
		
		// 국내도서 리스트
		List<NewBook> listInNewbook = nbs.selectInNewBookList(newbook); // startRow, endRow, orderType, nb_category2 컬럼을 담고 리스트를 출력하러 감.
		System.out.println("GbController selectInNewBookList listNewbook.size() -> "+listInNewbook.size());
		
		model.addAttribute("listInNewbook", listInNewbook);
		model.addAttribute("inNewbookCnt", inNewbookCnt);
		model.addAttribute("page", page);
		model.addAttribute("newbook", newbook);
		
		
		return "gb/foInNewbookList";
	}
	
	// 검색 도서 리스트 조회
	@GetMapping("searchNewbookList")
	// form에서 파라미터 값을 받아올 떄에는 DTO에 변수와 동일하게 작성하면 자동으로 DTO의 변수와 매핑되어 가져온다.
	public String selectSearchNewbookList(NewBook newbook, String currentPage, Model model) {
		System.out.println("GbController selectSearchNewbookList start...");

		// 정렬 유형, 초기값(null)이면 --> recently
		String orderType_default = "recently";
		if( newbook.getOrderType() == null ) {
			newbook.setOrderType(orderType_default);
		}
		
		// 키워드 검색 결과 도서 총 개수
		int searchNewbookCnt = nbs.selectSearchNewBookCnt(newbook); // 카테고리별 총 개수를 구해준다.
		System.out.println("GbController selectInNewBookList searchNewbookCnt -> "+searchNewbookCnt);	
		
		// 페이징 처리 작업
		Paging page = new Paging(searchNewbookCnt, currentPage);
		// Parameter searchnewbook --> Page만 추가 Setting
		newbook.setStart(page.getStartRow());
		newbook.setEnd(page.getEndRow());
		System.out.println("GbController orderType -> "+newbook.getOrderType());
		
		// 국내도서 리스트
		List<NewBook> listSearchNewbook = nbs.selectSearchNewBookList(newbook); // startRow, endRow, orderType, nb_category2 컬럼을 담고 리스트를 출력하러 감.
		System.out.println("GbController selectSearchNewbookList listSearchNewbook.size() -> "+listSearchNewbook.size());
		
//		System.out.println("newbook.getSearch_type -> "+newbook.getSearch_type());
//		System.out.println("newbook.getSearch_keyword -> "+newbook.getSearch_keyword());
		
		model.addAttribute("search_Newbook", newbook);
		model.addAttribute("listSearchNewbook", listSearchNewbook);
		model.addAttribute("search_NewbookCnt", searchNewbookCnt);
		model.addAttribute("page", page);
		
		return "gb/searchNewbookList";
		
	}
	
	// 상품 상페 페이지
	@RequestMapping("newbookDetail")
	public String selectNewbookDetail(NewBook newbook, Model model) {
		System.out.println("GbController selectNewbookDetail start...");
		System.out.println("GbController selectNewbookDetail newbook.getNb_num()"+newbook.getNb_num());
		
		NewBook selectNewbook = nbs.selectNewBookDetail(newbook.getNb_num());
		String publi_date1 = selectNewbook.getNb_publi_date().substring(0,10);
		selectNewbook.setNb_publi_date(publi_date1);
		
		model.addAttribute("newbook", selectNewbook);
		
		return "gb/newbookDetail";
	}
}
