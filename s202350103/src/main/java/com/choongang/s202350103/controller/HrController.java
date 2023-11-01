package com.choongang.s202350103.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.choongang.s202350103.hrService.MemberService;
import com.choongang.s202350103.hrService.OrderService;
import com.choongang.s202350103.hrService.Paging;
import com.choongang.s202350103.model.Orderr;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j 
public class HrController {
	public final MemberService ms;
	public final OrderService os;
	
	@RequestMapping(value = "helloFo")
	public String memTot1(Model model) {
		System.out.println("Controller start..");
		int result = ms.memTot();
		System.out.println("Controller result -> "+ result);
		model.addAttribute("result", result);
		return "commonFo";
	}
	
	@RequestMapping(value = "helloBo")
	public String memTot2(Model model) {
		System.out.println("Controller start..");
		int result = ms.memTot();
		System.out.println("Controller result -> "+ result);
		model.addAttribute("result", result);
		return "commonBo";
	}
	
	// BO 주문목록
	// boOrderList.jsp
	@RequestMapping(value = "boOrderList")
	public String selectOrderrList(Model model, Orderr orderr, String currentPage) {
		System.out.println("HrController selectOrderrList() start..");
		// 전체 건수
		int cnt = os.countOrderrList();
		
		// 페이징
		Paging page = new Paging(cnt, currentPage);
		orderr.setStart(page.getStart());
		orderr.setEnd(page.getEnd());
		
		// 목록
		List<Orderr> orderrList = os.selectOrderrList(orderr);
		System.out.println("HrController cnt -> "+ cnt);
		System.out.println("HrController orderrList.size() -> "+ orderrList.size());
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("orderrList", orderrList);
		model.addAttribute("page", page);
		
		System.out.println("HrController selectOrderrList() end..");
		return "/hr/boOrderList";
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@RequestMapping(value = "boOrderDetail")
	public String selectOrderr(Model model, long o_order_num) {
		System.out.println("HrController selectOrderr() start..");
		
		Orderr orderr = new Orderr();
		orderr = os.selectOrderr(o_order_num);
		System.out.println("HrController selectOrderr() orderr.getM_name() -> "+orderr.getM_name());
		
		model.addAttribute("orderr", orderr);
		
		System.out.println("HrController selectOrderr() end..");
		return "/hr/boOrderDetail";
	}
}
