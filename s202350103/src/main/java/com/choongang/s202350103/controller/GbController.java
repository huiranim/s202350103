package com.choongang.s202350103.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.s202350103.gbService.NewBookOldBookService;
import com.choongang.s202350103.gbService.NewBookService;
import com.choongang.s202350103.gbService.Paging;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.NewBookOldBook;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class GbController {
   
   private final NewBookService nbs;
   private final NewBookOldBookService nbods;
   
   // 도서 전체 리스트 조회
   @RequestMapping("innewbookList")
   public String selectInNewBookList(HttpSession session, Member member, NewBook newbook, String currentPage, Model model) {
      System.out.println("GbController selectInNewBookList start...");
      
      // 로그인한 멤버 값 불러오기
      member =(Member) session.getAttribute("member");
      if (member != null) {
         newbook.setM_num(member.getM_num());
      }
      
      // 정렬 유형, 초기값(null)이면 --> recently
      String orderType_default = "recently";
      if( newbook.getOrderType() == null ) {
         newbook.setOrderType(orderType_default);
      }
      
      // 도서 총 개수
      int inNewbookCnt = nbs.selectInNewBookCnt(newbook); // 카테고리별 총 개수를 구해준다.
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
      
      // 조회수 최대 값 구하기
      int hit_nb_num = nbs.selectHitNbNum();
      newbook.setHit_nb_num(hit_nb_num);
      
      model.addAttribute("member", member);
      model.addAttribute("listInNewbook", listInNewbook);
      model.addAttribute("inNewbookCnt", inNewbookCnt);
      model.addAttribute("page", page);
      model.addAttribute("newbook", newbook);
      
      
      return "gb/foInNewbookList";
   }
   
   // 검색 도서 리스트 조회
   @GetMapping("searchNewbookList")
   // form에서 파라미터 값을 받아올 떄에는 DTO에 변수와 동일하게 작성하면 자동으로 DTO의 변수와 매핑되어 가져온다.
   public String selectSearchNewbookList(HttpSession session, Member member, NewBook newbook, String currentPage, Model model) {
      System.out.println("GbController selectSearchNewbookList start...");
      
      // 로그인한 멤버 값 불러오기
      member =(Member) session.getAttribute("member");
      if (member != null) {
         newbook.setM_num(member.getM_num());
      }
      
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
      
      // 국내도서 검색 리스트
      System.out.println("GbController selectSearchNewbookList m_num -> "+newbook.getM_num());
      List<NewBook> listSearchNewbook = nbs.selectSearchNewBookList(newbook); // startRow, endRow, orderType, nb_category2, search_type, search_keyword 컬럼을 담고 리스트를 출력하러 감.
      System.out.println("GbController selectSearchNewbookList listSearchNewbook.size() -> "+listSearchNewbook.size());
      System.out.println("GbController selectSearchNewbookList listSearchNewbook.w_wish -> "+listSearchNewbook.get(0).getW_wish());
      
      model.addAttribute("member", member);
      model.addAttribute("search_Newbook", newbook);
      model.addAttribute("listSearchNewbook", listSearchNewbook);
      model.addAttribute("search_NewbookCnt", searchNewbookCnt);
      model.addAttribute("page", page);
      
      return "gb/searchNewbookList";
      
   }
   
   // 상품 상페 페이지
   @RequestMapping("newbookDetail")
   public String selectNewbookDetail(NewBook newbook, HttpSession session, Member member, Model model) {
      System.out.println("GbController selectNewbookDetail start...");
      System.out.println("GbController selectNewbookDetail newbook.getNb_num()"+newbook.getNb_num());
      
      // 회원정보 가져오기
      member =(Member) session.getAttribute("member");
      if(member != null) { newbook.setM_num(member.getM_num()); }
      
      // 조회 수 +1
      int result = nbs.updateReadCnt(newbook.getNb_num());
      System.out.println("GbController selectNewbookDetail result -> "+result);
      
      // 상세 정보
      NewBook selectNewbook = nbs.selectNewBookDetail(newbook);
      String publi_date1 = selectNewbook.getNb_publi_date().substring(0,10);
      selectNewbook.setNb_publi_date(publi_date1);
      
      // 동일한 중고도서 개수
      int same_obCnt = nbods.selectSameOldBookList(newbook.getNb_num()).size();
      selectNewbook.setSame_obCnt(same_obCnt);
      
      model.addAttribute("member", member);
      model.addAttribute("newbook", selectNewbook);
      
      return "gb/newbookDetail"; 
   }
   
   // 동일한 중고도서 목록 리스트
   @ResponseBody
   @RequestMapping("sameOldBookList") 
   public List<NewBookOldBook> sameOldBookList(int nb_num){ 
      System.out.println("GbController sameOldBookList start...");
     
      List<NewBookOldBook> sameOldBookList = nbods.selectSameOldBookList(nb_num);
      System.out.println("GbController sameOldBookList sameOldBookList.size->" + sameOldBookList.size());
     
      return sameOldBookList; 
   }
   
   // 찜하기
   @ResponseBody
   @RequestMapping("/wish/wishclick") 
   public String wishClick(WishList wishlist, HttpSession session, Member member) {
      System.out.println("GbController wishClick() start...");
        
      // 로그인한 멤버 값 불러오기 
      member =(Member) session.getAttribute("member");
      if(member == null) { return "loginForm"; }
      else              { wishlist.setM_num(member.getM_num());}
        
      // 찜하기
      String wish = String.valueOf(nbs.insertUpdateWish(wishlist));
        
      return wish; 
   }
     
   // 장바구니 버튼 클릭했을 때
   @ResponseBody
   @RequestMapping("/cart/cartclick")
   public String cartClick(Cart cart, HttpSession session, Member member) {
      
      // 로그인한 멤버 값 불러오기 
      member =(Member) session.getAttribute("member");
      if(member == null) { return "loginForm"; }
      else              { cart.setM_num(member.getM_num());}
      
      // 장바구니 담기
      String cartResult = String.valueOf(nbs.insertCart(cart));
      
      return cartResult;
   }
   
   // 장바구니 화면에서 수정버튼 클릭 시
   @PostMapping("cartList")
   public String cartList(@RequestParam int[] nb_num, @RequestParam int[] quantity, 
                     HttpSession session, Member member, Model model) {
      // 로그인한 멤버 값 불러오기 
      member =(Member) session.getAttribute("member");
      
      // 장바구니에 담긴 상품 리스트
      for (int i=0; i<nb_num.length; i++) {
         Cart cart = new Cart();
         cart.setM_num(member.getM_num());
         cart.setC_count(quantity[i]);
         cart.setNb_num(nb_num[i]);
         nbs.updateCartCount(cart);
      }
      
      return "redirect:memberCartList";
      
   }
   
}