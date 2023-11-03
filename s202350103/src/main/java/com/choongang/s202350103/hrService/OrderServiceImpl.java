package com.choongang.s202350103.hrService;

import java.util.List;
import org.springframework.stereotype.Service;
import com.choongang.s202350103.hrDao.OrderDao;
import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.Orderr;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {
	private final OrderDao od;

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
	// BO 주문상세 - 취소처리
	@Override
	public int statusCancellation(long o_order_num) {
		System.out.println("OrderServiceImpl statusCancellation() start..");
		
		int result = od.statusCancellation(o_order_num);
		System.out.println("OrderServiceImpl statusCancellation() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusCancellation() end..");
		return result;
	}
	// BO 주문상세 - 배송완료
	@Override
	public int statusDelivered(long o_order_num) {
		System.out.println("OrderServiceImpl statusDelivered() start..");
		
		int result = od.statusDelivered(o_order_num);
		System.out.println("OrderServiceImpl statusDelivered() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusDelivered() end..");
		return result;
	}
	// BO 주문상세 - 구매확정
	@Override
	public int statusConfirmation(long o_order_num) {
		System.out.println("OrderServiceImpl statusConfirmation() start..");
		
		int result = od.statusConfirmation(o_order_num);
		System.out.println("OrderServiceImpl statusConfirmation() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusConfirmation() end..");
		return result;
	}
	// BO 주문상세 - 발송처리
	@Override
	public int statusShipping(Orderr orderr) {
		System.out.println("OrderServiceImpl statusShipping() start..");
		
		int result = od.statusShipping(orderr);
		System.out.println("OrderServiceImpl statusShipping() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusShipping() end..");
		return result;
	}
	// BO 주문상세 - 교환처리
	@Override
	public int statusExchange(Orderr orderr) {
		System.out.println("OrderServiceImpl statusExchange() start..");
		
		int result = od.statusExchange(orderr);
		System.out.println("OrderServiceImpl statusExchange() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusExchange() end..");
		return result;
	}
	// BO 주문상세 - 반품처리
	@Override
	public int statusReturn(Orderr orderr) {
		System.out.println("OrderServiceImpl statusReturn() start..");
		
		int result = od.statusReturn(orderr);
		System.out.println("OrderServiceImpl statusReturn() result -> "+result);		
		
		System.out.println("OrderServiceImpl statusReturn() end..");
		return result;
	}



}
