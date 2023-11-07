package com.choongang.s202350103.hrDao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.OrderDetail;
import com.choongang.s202350103.model.Orderr;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDaoImpl implements OrderDao {
	private final SqlSession session;

	// BO 주문목록 - total
	// boOrderList.jsp
	@Override
	public int countOrderrList() {
		System.out.println("OrderDaoImpl countOrderrList() start..");
		int cnt = 0;
		try {
			cnt = session.selectOne("hrCountOrderrList");
			System.out.println("OrderDaoImpl cnt -> "+cnt);
		} catch (Exception e) {
			System.out.println("OrderDaoImpl countOrderrList() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl countOrderrList() end..");
		return cnt;
	}
	// BO 주문목록 - 각 row
	@Override
	public List<Orderr> selectOrderrList(Orderr orderr) {
		System.out.println("OrderDaoImpl selectOrderrList() start..");
		List<Orderr> orderrList = new ArrayList<Orderr>();
		
		try {
			orderrList = session.selectList("hrSelectOrderrList", orderr);
			System.out.println("OrderDaoImpl orderrList.size() -> "+ orderrList.size());
		} catch (Exception e) {
			System.out.println("OrderDaoImpl selectOrderrList() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectOrderrList() end..");
		return orderrList;
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@Override
	public Orderr selectOrderr(long o_order_num) {
		System.out.println("OrderDaoImpl selectOrderr() start..");
		
		Orderr orderr = new Orderr();
		try {
			orderr = session.selectOne("hrSelectOrder", o_order_num);
			System.out.println("OrderDaoImpl selectOrderr() orderr.getM_name() -> "+orderr.getM_name());
		} catch (Exception e) {
			System.out.println("OrderDaoImpl selectOrderr() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectOrderr() end..");
		return orderr;
	}
	// BO 주문상세 - 취소처리 (1 -> 5)
	@Override
	public int statusCancellation(long o_order_num) {
		System.out.println("OrderDaoImpl statusCancellation() start..");
		
		int result1, result2, result = 0;
		try {
			result1 = session.update("hrStatusCancellation", o_order_num);
			result2 = session.insert("hrInsertCancellation", o_order_num);
			if(result1 == 1 && result2 == 1) {
				result = 1;
			}
			System.out.println("OrderDaoImpl statusCancellation() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusCancellation() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusCancellation() end..");
		return result;
	}
	// BO 주문상세 - 배송완료 (2 -> 3)
	@Override
	public int statusDelivered(long o_order_num) {
		System.out.println("OrderDaoImpl statusDelivered() start..");
		
		int result = 0;
		try {
			result = session.update("hrStatusDelivered", o_order_num);
			System.out.println("OrderDaoImpl statusDelivered() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusDelivered() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusDelivered() end..");
		return result;
	}
	// BO 주문상세 - 구매확정 (3 -> 4)
	@Override
	public int statusConfirmation(long o_order_num) {
		System.out.println("OrderDaoImpl statusConfirmation() start..");
		
		int result = 0;
		try {
			result = session.update("hrStatusConfirmation", o_order_num);
			System.out.println("OrderDaoImpl statusConfirmation() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusConfirmation() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusConfirmation() end..");
		return result;
	}
	// BO 주문상세 - 발송처리 (1 -> 2)
	@Override
	public int statusShipping(Orderr orderr) {
		System.out.println("OrderDaoImpl statusShipping() start..");
		
		int result = 0;
		try {
			result = session.update("hrStatusShipping", orderr);
			System.out.println("OrderDaoImpl statusShipping() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusShipping() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusShipping() end..");
		return result;
	}
	// BO 주문상세 - 교환처리 (3 -> 6)
	@Override
	public int statusExchange(Orderr orderr) {
		System.out.println("OrderDaoImpl statusExchange() start..");
		
		int result1, result2, result = 0;
		try {
			result1 = session.update("hrStatusExchange", orderr);
			result2 = session.insert("hrInsertExchange", orderr);
			if(result1 == 1 && result2 == 1) {
				result = 1;
			}
			System.out.println("OrderDaoImpl statusExchange() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusExchange() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusExchange() end..");
		return result;
	}
	// BO 주문상세 - 반품처리 (3 -> 7)
	@Override
	public int statusReturn(Orderr orderr) {
		System.out.println("OrderDaoImpl statusReturn() start..");
		
		int result1, result2, result = 0;
		try {
			result1 = session.update("hrStatusReturn", orderr);
			result2 = session.insert("hrInsertReturn", orderr);
			if(result1 == 1 && result2 == 1) {
				result = 1;
			}
			System.out.println("OrderDaoImpl statusReturn() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusReturn() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl statusReturn() end..");
		return result;
	}
	// BO 주문상세 - 상품목록
	@Override
	public List<OrderDetail> selectOrderProduct(long o_order_num) {
		System.out.println("OrderDaoImpl selectOrderProduct() start..");
		
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		
		try {
			orderDetailList = session.selectList("hrSelectOrderProduct", o_order_num);
			System.out.println("OrderDaoImpl orderDetailList.size() -> "+ orderDetailList.size());
		} catch (Exception e) {
			System.out.println("OrderDaoImpl selectOrderProduct() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectOrderProduct() end..");
		return orderDetailList;
	}


}
