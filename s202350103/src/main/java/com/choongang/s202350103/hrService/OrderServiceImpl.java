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



}
