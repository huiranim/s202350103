package com.choongang.s202350103.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.choongang.s202350103.hrService.MemberService;
import com.choongang.s202350103.hrService.NewbookService;
import com.choongang.s202350103.hrService.OrderService;
import com.choongang.s202350103.hrService.Paging;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.OrderGift;
import com.choongang.s202350103.model.Orderr;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j 
public class HrController {
	private final MemberService  ms;
	private final OrderService 	 os;
	private final NewbookService ns;
	private final JavaMailSender mailSender;
	
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
	public String selectOrderrBo(Model model, long o_order_num) {
		System.out.println("HrController selectOrderrBo() start..");
		
		Orderr orderr = new Orderr();
		orderr = os.selectOrderr(o_order_num);
		System.out.println("HrController selectOrderrBo() orderr.getM_name() -> "+orderr.getM_name());
		
		model.addAttribute("orderr", orderr);
		
		System.out.println("HrController selectOrderrBo() end..");
		return "/hr/boOrderDetail";
	}
	
	// BO 주문상세 - 취소처리 (1 -> 5)
	// 주문 접수 상태일 때, 취소처리 버튼 클릭 시 주문상태값 취소로 변경
	@ResponseBody
	@RequestMapping("/statusCancellation")
	public String statusCancellation(long o_order_num) {
		System.out.println("HrController statusCancellation() start..");

		System.out.println("HrController statusCancellation() o_order_num -> "+o_order_num);
		int result = os.statusCancellation(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusCancellation() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusCancellation() end..");
		return stringResult;
	}
	// BO 주문상세 - 배송완료 (2 -> 3)
	// 배송중 상태일 때, 배송완료 버튼 클릭 시 주문상태값 배송완료로 변경
	@ResponseBody
	@RequestMapping("/statusDelivered")
	public String statusDelivered(long o_order_num) {
		System.out.println("HrController statusDelivered() start..");
		
		System.out.println("HrController statusDelivered() o_order_num -> "+o_order_num);
		int result = os.statusDelivered(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusDelivered() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusDelivered() end..");
		return stringResult;
	}
	// BO 주문상세 - 구매확정 (3 -> 4)
	// 배송완료 상태일 때, 구매확정 버튼 클릭 시 주문상태값 구매확정로 변경
	@ResponseBody
	@RequestMapping("/statusConfirmation")
	public String statusConfirmation(long o_order_num) {
		System.out.println("HrController statusConfirmation() start..");
		
		System.out.println("HrController statusConfirmation() o_order_num -> "+o_order_num);
		int result = os.statusConfirmation(o_order_num);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusConfirmation() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusConfirmation() end..");
		return stringResult;
	}
	// BO 주문상세 - 발송처리 팝업
	@RequestMapping("/boShippingPopup")
	public String boShippingPopup(Model model, long o_order_num) {
		System.out.println("HrController boShippingPopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boShippingPopup() end..");
		return "/hr/boShippingPopup";
	}
	// BO 주문상세 - 발송처리 (1 -> 2)
	@ResponseBody
	@RequestMapping("/statusShipping")
	public String statusShipping(Orderr orderr) {
		System.out.println("HrController statusShipping() start..");
		
		System.out.println("HrController statusShipping() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusShipping(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusShipping() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusShipping() end..");
		return stringResult;
	}
	// BO 주문상세 - 교환처리 팝업
	@RequestMapping("/boExchangePopup")
	public String boExchangePopup(Model model, long o_order_num) {
		System.out.println("HrController boExchangePopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boExchangePopup() end..");
		return "/hr/boExchangePopup";
	}
	// BO 주문상세 - 교환처리 (3 -> 6)
	@ResponseBody
	@RequestMapping("/statusExchange")
	public String statusExchange(Orderr orderr) {
		System.out.println("HrController statusExchange() start..");
		
		System.out.println("HrController statusExchange() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusExchange(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusExchange() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusExchange() end..");
		return stringResult;
	}
	// BO 주문상세 - 반품처리 팝업
	@RequestMapping("/boReturnPopup")
	public String boReturnPopup(Model model, long o_order_num) {
		System.out.println("HrController boReturnPopup() start..");
		
		model.addAttribute("o_order_num", o_order_num);
		
		System.out.println("HrController boReturnPopup() end..");
		return "/hr/boReturnPopup";
	}
	// BO 주문상세 - 반품처리 (3 -> 7)
	@ResponseBody
	@RequestMapping("/statusReturn")
	public String statusReturn(Orderr orderr) {
		System.out.println("HrController statusReturn() start..");
		
		System.out.println("HrController statusReturn() o_order_num -> "+orderr.getO_order_num());
		int result = os.statusReturn(orderr);
		String stringResult = Long.toString(result);
		System.out.println("HrController statusReturn() stringResult -> "+stringResult);		
		
		System.out.println("HrController statusReturn() end..");
		return stringResult;
	}
	// BO 주문상세 - 상품목록
	// boOrderProductPopup.jsp
	@RequestMapping("/boOrderDetail/List")
	public String selectOrderProduct(Model model, long o_order_num) {
		System.out.println("HrController selectOrderProduct() start..");
		
		List<OrderDetail> orderDetailList = os.selectOrderProduct(o_order_num);
		System.out.println("HrController orderDetailList.size() -> "+ orderDetailList.size());

		model.addAttribute("cnt", orderDetailList.size());
		model.addAttribute("orderDetailList", orderDetailList);

		System.out.println("HrController selectOrderProduct() end..");
		return "/hr/boOrderProductPopup";
	}
	
	
	// FO 주문상세
	// foOrderDetail.jsp
	@RequestMapping(value = "foOrderDetail")
	public String selectOrderrFo(Model model, long o_order_num) {
		System.out.println("HrController selectOrderrFo() start..");
		
		Orderr orderr = new Orderr();
		orderr = os.selectOrderr(o_order_num);
		System.out.println("HrController selectOrderrFo() orderr.getM_name() -> "+orderr.getM_name());
		
		model.addAttribute("orderr", orderr);
		
		System.out.println("HrController selectOrderrFo() end..");
		return "/hr/foOrderDetail";
	}
	
	// FO 선물하기 - 화면
	// foGivingGift.jsp
	@RequestMapping("foGivingGift")
	public String givingGift(Model model, Member member, HttpSession session, int nb_num, int quantity) {
		System.out.println("HrController givingGift() start..");
		
		// model에 회원 정보 저장
		member = (Member) session.getAttribute("member");
		System.out.println("HrController givingGift() member.getM_name() -> "+member.getM_name());
		model.addAttribute("member", member);
		
		// model에 상품 정보 저장
		NewBook newbook = ns.selectNewbook(nb_num);
		System.out.println("HrController givingGift() newbook.getNb_title() -> "+newbook.getNb_title());
		model.addAttribute("newbook", newbook);
		
		// model에 선택 수량 저장
		model.addAttribute("quantity", quantity);
		
		System.out.println("HrController givingGift() end..");
		return "/hr/foGivingGift";
	}
	
	// FO 선물하기 - 액션
	@RequestMapping("foGivingGiftAction")
	public String givingGiftAction(Model model, HttpSession session, Member member, Orderr orderr, OrderGift orderGift, RedirectAttributes redirect) {
		System.out.println("HrController givingGiftAction() start..");
		
		// session으로부터 member 도출
		member = (Member) session.getAttribute("member");
		System.out.println("HrController givingGift() member.getM_name()"+member.getM_name());
		model.addAttribute("member", member);
		
		// value 확인
		// ORDERR
			// m_num
			System.out.println("member.getM_num()->"+member.getM_num());
			System.out.println("orderr.getM_num()->"+orderr.getM_num());
			// o_pay_price
			System.out.println("orderr.getO_pay_price()->"+orderr.getO_pay_price());
			// o_deliv_price
			System.out.println("orderr.getO_deliv_price()->"+orderr.getO_deliv_price());
			// o_point
			System.out.println("orderr.getO_point()->"+orderr.getO_point());
			// o_rec_name
			System.out.println("orderr.getO_rec_name()->"+orderr.getO_rec_name());
			// o_rec_mail
			System.out.println("orderr.getO_rec_mail()->"+orderr.getO_rec_mail());
			// o_rec_ph 
			System.out.println("orderr.getO_rec_ph()->"+orderr.getO_rec_ph());
			// nb_num
			System.out.println("orderr.getNb_num()->"+orderr.getNb_num());
			// o_de_count
			System.out.println("orderr.getO_de_count()->"+orderr.getO_de_count());

		// ORDER_GIFT
			// o_gift_card
			System.out.println("orderGift.getO_gift_card()->"+orderGift.getO_gift_card());
			// o_gift_msg
			System.out.println("orderGift.getO_gift_msg()->"+orderGift.getO_gift_msg());
			
		// Service Method 실행 후 model에 result 저장
		int result = os.givingGiftAction(member, orderr, orderGift);
		model.addAttribute("giftResult", result);
		
		// 메일 발송을 위해 주요 객체 redirect에 저장
		redirect.addFlashAttribute("member", member);
		redirect.addFlashAttribute("orderr", orderr);
		redirect.addFlashAttribute("orderGift", orderGift);
		
		System.out.println("HrController givingGiftAction() end..");
		return "redirect:giftMailing";
	}
	
	// FO 선물하기 - 메일 발송
	@RequestMapping("giftMailing")
	public String giftMailing(HttpServletRequest request, Model model, HttpSession session, 
							  @ModelAttribute("member") Member member,
							  @ModelAttribute("orderr") Orderr orderr,
							  @ModelAttribute("orderGift") OrderGift orderGift
							  ) {
		System.out.println("HrController giftMailing() start..");
		
		// 정보 GET
		String tomail = orderr.getO_rec_mail();
		String m_name = member.getM_name();
		String n_title = ns.selectNewbook(orderr.getNb_num()).getNb_title();
		int o_de_count = orderr.getO_de_count();
		String o_gift_msg = orderGift.getO_gift_msg();
		long o_order_num = orderr.getO_order_num();

		// 받는 사람
		System.out.println("HrController giftMailing() tomail -> "+tomail);
		
		// 보내는 사람
		String setfrom = "gml2511@gmail.com";
		
		// 제목
		String title = "[DADOK] "+m_name+"님으로부터 선물이 도착했습니다!";
		
		// 내용
		String contents = "안녕하세요. DADOK입니다. \n"
							+ m_name + "님이 선물과 메시지를 보냈습니다. \n\n"
							
							+ "선물 : " + n_title + " " + o_de_count + "개 \n"
							+ "메시지 : " + o_gift_msg + "\n\n"
							
							+ "아래 링크를 클릭하여 선물을 받아보세요! \n"
							+ "http://localhost:8200/foGettingGift?o_order_num="+o_order_num+"\n\n"
							
							+ "* 받는 사람 정보를 정확히 입력해주세요. \n"
							+ "* 입력 후 수락하기 버튼을 클릭해야 발송이 시작됩니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(contents);
			mailSender.send(message);
			model.addAttribute("mailingResult", 1);
			
			model.addAttribute("member", member);
			model.addAttribute("orderr", orderr);
			model.addAttribute("n_title", n_title);
			model.addAttribute("orderGift", orderGift);

		} catch (Exception e) {
			System.out.println("HrController giftMailing() e.getMessage() -> "+e.getMessage());		
			model.addAttribute("mailingResult", 0);
		}
		
		System.out.println("HrController giftMailing() end..");		
		return "/hr/foGivingGiftAction";
	}
	
	// FO 선물받기 - 화면
	// foGettingGift.jsp
	@RequestMapping("foGettingGift")
	public String gettingGift(Model model, long o_order_num) {
		System.out.println("HrController gettingGift() start..");
		
		// o_order_num -> orderr 객체 조회
		// 기본 컬럼 : o_rec_name, o_rec_mail, o_rec_ph
		// 조인 컬럼 : m_name, m_ph, nb_image, nb_title, o_de_count
		Orderr orderr = os.selectOrderr_GiftType(o_order_num);
		System.out.println("HrController gettingGift() orderr.getM_name() -> "+orderr.getM_name());
		
		// o_order_num -> orderGift 객체 조회
		// 기본 컬럼 : o_gift_card, o_gift_msg
		OrderGift orderGift = os.selectOrderGift(o_order_num);
		System.out.println("HrController gettingGift() orderGift.getO_gift_num() -> "+orderGift.getO_gift_num());		
		
		// model에 orderr, orderGift 객체 저장
		model.addAttribute("orderr", orderr);
		model.addAttribute("orderGift", orderGift);

		System.out.println("HrController gettingGift() orderr.getO_order_num() -> "+orderr.getO_order_num());		
		
		System.out.println("HrController gettingGift() end..");
		return "/hr/foGettingGift";
	}
	
	// FO 선물받기 - 액션
	@RequestMapping("foGettingGiftAction")
	public String gettingGiftAction(Model model, HttpSession session, Orderr orderr, OrderGift orderGift
									, String o_rec_addr1, String o_rec_addr2, String o_rec_addr3) {
		System.out.println("HrController gettingGiftAction() start..");
		
		// value 확인
		// ORDERR
			// o_order_num
			System.out.println("orderr.getO_order_num()->"+orderr.getO_order_num());
			// o_rec_name
			System.out.println("orderr.getO_rec_name()->"+orderr.getO_rec_name());
			// o_rec_mail
			System.out.println("orderr.getO_rec_mail()->"+orderr.getO_rec_mail());
			// o_rec_ph 
			System.out.println("orderr.getO_rec_ph()->"+orderr.getO_rec_ph());
			
		// value 세팅
			orderGift.setO_gift_name(orderr.getO_rec_name());
			orderGift.setO_gift_ph(orderr.getO_rec_mail());
			
			orderr.setO_rec_addr("("+o_rec_addr1+")/"+ o_rec_addr2 +"/"+ o_rec_addr3 );
			System.out.println("orderr.getO_rec_addr()->"+orderr.getO_rec_addr());

		// Service Method 실행 후 model에 result 저장
			int result = os.gettingGiftAction(orderr, orderGift);
			model.addAttribute("result", result);

		System.out.println("HrController gettingGiftAction() end..");
		return "/hr/foGettingGiftAction";
	}

}
