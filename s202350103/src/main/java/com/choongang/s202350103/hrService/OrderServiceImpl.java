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

	// BO 주문목록
	// boOrderList.jsp
	@Override
	public int countOrderrList() {
		System.out.println("OrderServiceImpl countOrderrList() start..");
		int cnt = od.countOrderrList();
		System.out.println("OrderServiceImpl cnt -> "+cnt);
		System.out.println("OrderServiceImpl countOrderrList() end..");
		return cnt;
	}
	@Override
	public List<Orderr> selectOrderrList(Orderr orderr) {
		System.out.println("OrderServiceImpl selectOrderrList() start..");
		List<Orderr> orderrList = od.selectOrderrList(orderr);
		System.out.println("OrderServiceImpl orderrList.size() -> "+ orderrList.size());
		for(Orderr order : orderrList) {
			System.out.println("selectOrderrList nb_title->"+order.getNb_title());
	    }
		
//		int nb_num;
//						// 10건
//		for(Orderr oderr : orderrList) {
//			nb_num = od.minNbNum(oderr.getO_order_num());
//			
//			if (nb_num < 200000) {
//				oderr.setNb_title(od.selectNBTitleByNum(nb_num));
//			} else {
//				oderr.setNb_title(od.selectOBTitleByNum(nb_num));
//			}
//		}
		System.out.println("OrderServiceImpl selectOrderrList() end..");
		return orderrList;
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@Override
	public Orderr selectOrderr(int o_order_num) {
		System.out.println("OrderServiceImpl selectOrderr() start..");
		Orderr orderr = od.selectOrderr(o_order_num);
		
		System.out.println("OrderServiceImpl selectOrderr() orderr.getM_name() -> "+orderr.getM_name());
		
		System.out.println("OrderServiceImpl selectOrderr() end..");
		return orderr;
	}



}
