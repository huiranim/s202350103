package com.choongang.s202350103.hrDao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
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
	// BO 주문상세 - 취소처리
	@Override
	public int statusCancellation(long o_order_num) {
		System.out.println("OrderDaoImpl selectOrderr() start..");
		
		int result = 0;
		try {
			result = session.update("hrStatusCancellation", o_order_num);
			System.out.println("OrderDaoImpl statusCancellation() result -> "+result);					
		} catch (Exception e) {
			System.out.println("OrderDaoImpl statusCancellation() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectOrderr() end..");
		return result;
	}


}
