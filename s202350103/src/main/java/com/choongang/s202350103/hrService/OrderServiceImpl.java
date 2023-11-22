package com.choongang.s202350103.hrService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.choongang.s202350103.hrDao.OrderDao;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.OrderGift;
import com.choongang.s202350103.model.Orderr;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	private final OrderDao od;
	
	// Transaction 관리
	private final PlatformTransactionManager transactionManager;

	// BO 주문목록 - total
	// boOrderList.jsp
	@Override
	public int countOrderrList() {
		System.out.println("OrderServiceImpl countOrderrList() start..");
		int cnt = od.countOrderrList();
		System.out.println("OrderServiceImpl cnt -> "+cnt);
		System.out.println("OrderServiceImpl countOrderrList() end..");
		return cnt;
	}
	// BO 주문목록 - 각 row
	@Override
	public List<Orderr> selectOrderrList(Orderr orderr) {
		System.out.println("OrderServiceImpl selectOrderrList() start..");
		
		List<Orderr> orderrList = od.selectOrderrList(orderr);
		
		System.out.println("OrderServiceImpl orderrList.size() -> "+ orderrList.size());
		for(Orderr order : orderrList) {
			System.out.println("selectOrderrList nb_title->"+order.getNb_title());
	    }
		System.out.println("OrderServiceImpl selectOrderrList() end..");
		return orderrList;
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@Override
	public Orderr selectOrderr(long o_order_num) {
		System.out.println("OrderServiceImpl selectOrderr() start..");
		Orderr orderr = od.selectOrderr(o_order_num);
		
		System.out.println("OrderServiceImpl selectOrderr() orderr.getM_name() -> "+orderr.getM_name());
		
		System.out.println("OrderServiceImpl selectOrderr() end..");
		return orderr;
	}
	// BO 주문상세 - 취소처리 (1 -> 5)
	@Override
	public int statusCancellation(long o_order_num) {
		System.out.println("OrderServiceImpl statusCancellation() start..");
		
		int result = od.statusCancellation(o_order_num);
		System.out.println("OrderServiceImpl statusCancellation() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusCancellation() end..");
		return result;
	}
	// BO 주문상세 - 배송완료 (2 -> 3)
	@Override
	public int statusDelivered(long o_order_num) {
		System.out.println("OrderServiceImpl statusDelivered() start..");
		
		int result = od.statusDelivered(o_order_num);
		System.out.println("OrderServiceImpl statusDelivered() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusDelivered() end..");
		return result;
	}
	// BO 주문상세 - 구매확정 (3 -> 4)
	@Override
	public int statusConfirmation(long o_order_num) {
		System.out.println("OrderServiceImpl statusConfirmation() start..");
		
		int result = od.statusConfirmation(o_order_num);
		System.out.println("OrderServiceImpl statusConfirmation() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusConfirmation() end..");
		return result;
	}
	// BO 주문상세 - 발송처리 (1 -> 2)
	@Override
	public int statusShipping(Orderr orderr) {
		System.out.println("OrderServiceImpl statusShipping() start..");
		
		int result = od.statusShipping(orderr);
		System.out.println("OrderServiceImpl statusShipping() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusShipping() end..");
		return result;
	}
	// BO 주문상세 - 교환처리 (3 -> 6)
	@Override
	public int statusExchange(Orderr orderr) {
		System.out.println("OrderServiceImpl statusExchange() start..");
		
		int result = od.statusExchange(orderr);
		System.out.println("OrderServiceImpl statusExchange() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusExchange() end..");
		return result;
	}
	// BO 주문상세 - 반품처리 (3 -> 7)
	@Override
	public int statusReturn(Orderr orderr) {
		System.out.println("OrderServiceImpl statusReturn() start..");
		
		int result = od.statusReturn(orderr);
		System.out.println("OrderServiceImpl statusReturn() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusReturn() end..");
		return result;
	}
	// BO 주문상세 - 상품목록
	@Override
	public List<OrderDetail> selectOrderProduct(long o_order_num) {
		System.out.println("OrderServiceImpl selectOrderProduct() start..");
		
		List<OrderDetail> orderDetailList = od.selectOrderProduct(o_order_num);
		
		System.out.println("OrderServiceImpl orderDetailList.size() -> "+ orderDetailList.size());
		for(OrderDetail orderDetail : orderDetailList) {
			System.out.println("selectOrderProduct nb_title->"+orderDetail.getNb_title());
			System.out.println("selectOrderProduct o_de_count->"+orderDetail.getO_de_count());
	    }
		System.out.println("OrderServiceImpl selectOrderProduct() end..");
		return orderDetailList;
	}
	
	// FO 선물하기 - 액션
	@Override
	public int givingGiftAction(Member member, Orderr orderr, OrderGift orderGift) {
		System.out.println("OrderServiceImpl givingGiftAction() start..");
		
		// 선물 받는사람 정보 저장
		orderGift.setO_gift_name(orderr.getO_rec_name());
		orderGift.setO_gift_ph(orderr.getO_rec_mail());
		
		// 주문번호 생성
		long o_order_num = 0;
		
			// 당일 주문 확인 (없으면 오늘날짜 + '0001', 있으면 해당값 +1)
			long max_order_num = od.selectTodayOrderr();
			
			// 당일 주문 없을 때
			if(max_order_num == 0) {
				// 오늘 날짜 Get
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				Date today = new Date();
				long longToday = Long.parseLong(sdf.format(today));
				
				o_order_num = (longToday * 10000) + 0001;
				System.out.println("당일 주문 없을 때 o_order_num -> "+o_order_num);
			
			// 있을 때
			} else {
				o_order_num = max_order_num +1;
				System.out.println("당일 주문 있을 때 o_order_num -> "+o_order_num);
			}
		
		// 주문번호 저장
		orderr.setO_order_num(o_order_num);
		orderGift.setO_order_num(o_order_num);
		
		// 주문 INSERT & UPDATE
		int result = od.givingGiftAction(member, orderr, orderGift);
		
		System.out.println("OrderServiceImpl givingGiftAction() end..");
		return result;
	}
	
	// FO 선물받기 - 화면 - orderr 객체 조회
	@Override
	public Orderr selectOrderr_GiftType(long o_order_num) {
		System.out.println("OrderServiceImpl selectOrderr_GiftType() start..");

		Orderr orderr = od.selectOrderr_GiftType(o_order_num);
		System.out.println("OrderServiceImpl selectOrderr_GiftType() orderr.getM_name() -> "+orderr.getM_name());
		
		System.out.println("OrderServiceImpl selectOrderr_GiftType() end..");
		return orderr;
	}
	// FO 선물받기 - 화면 - orderGift 객체 조회
	@Override
	public OrderGift selectOrderGift(long o_order_num) {
		System.out.println("OrderServiceImpl selectOrderGift() start..");
		
		OrderGift orderGift = od.selectOrderGift(o_order_num);
		System.out.println("OrderServiceImpl selectOrderGift() orderGift.getO_gift_num() -> "+orderGift.getO_gift_num());		
		
		System.out.println("OrderServiceImpl selectOrderGift() end..");
		return orderGift;
	}
	
	// FO 선물받기 - 액션
	@Override
	public int gettingGiftAction(Orderr orderr, OrderGift orderGift) {
		System.out.println("OrderServiceImpl gettingGiftAction() start..");
		
		int result = od.gettingGiftAction(orderr, orderGift);
		System.out.println("OrderServiceImpl gettingGiftAction() result -> "+result);		
		
		System.out.println("OrderServiceImpl gettingGiftAction() end..");
		return result;
	}
	
	// BO 주문목록 - 임의 주문 생성 액션(CSV 파일 업로드)
	@Override
	public int orderUpload(List<Orderr> orderrList) {
		System.out.println("OrderServiceImpl orderUpload() start..");
		
		int result = 0, insertResult = 0;
		List<Integer> resultList = new ArrayList<Integer>();
		
		//Transaction 관리
		TransactionStatus txStatus = 
				transactionManager.getTransaction(new DefaultTransactionDefinition());
		
		try {
			// 라인별 주문번호 & 상품유형 SET
			for(Orderr orderr : orderrList) {
			
				// 주문번호 생성
				long o_order_num = 0;
				
					// 당일 주문 확인 (없으면 오늘날짜 + '0001', 있으면 해당값 +1)
					long max_order_num = od.selectTodayOrderr();
					
					// 당일 주문 없을 때
					if(max_order_num == 0) {
						// 오늘 날짜 Get
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						Date today = new Date();
						long longToday = Long.parseLong(sdf.format(today));
						
						o_order_num = (longToday * 10000) + 0001;
						System.out.println("당일 주문 없을 때 o_order_num -> "+o_order_num);
					
					// 있을 때
					} else {
						o_order_num = max_order_num +1;
						System.out.println("당일 주문 있을 때 o_order_num -> "+o_order_num);
					}
				
				// 주문번호 저장
				orderr.setO_order_num(o_order_num);
				
				// 상품유형 확인
				int o_de_prodtype = 0;
				
					// nb_num이 100000번대 일 때
					if(orderr.getNb_num() < 200000) {
						o_de_prodtype = 1;
						
					// nb_num이 200000번대 일 때
					} else {
						o_de_prodtype = 2;
					}
				
				// 상품유형 저장
				orderr.setO_de_prodtype(o_de_prodtype);
				
				// 주문 INSERT
				insertResult = od.orderUpload(orderr);
				System.out.println("OrderServiceImpl orderUpload() result -> "+result);
				
				// 개별 결과인 insertResult를 ArrayList resultList에 누적 저장
				resultList.add(insertResult);
			}
					
			// 최종 result 정의
			// resultList의 모든 원소가 1이면 result = 1 / 1이 아닌 순간 result = 2 & 끝
			for(int resultChk : resultList) {
				if (resultChk == 1) {
					result = 1;
				} else {
					result = 2;
					break;
				}
				System.out.println("HrController orderUpload() result -> "+result);
			}
			// COMMIT
			transactionManager.commit(txStatus);
			
		} catch (Exception e) {
			// ROLLBACK
			transactionManager.rollback(txStatus);
		
			System.out.println("OrderServiceImpl orderUpload() e.getMessage() -> "+e.getMessage());
			
		}
	
		System.out.println("OrderServiceImpl orderUpload() end..");
		return result;

	}
}
