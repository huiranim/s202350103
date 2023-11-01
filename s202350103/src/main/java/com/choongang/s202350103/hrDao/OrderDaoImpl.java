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

	// BO 주문목록
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
	@Override
	public int minNbNum(long o_order_num) {
		System.out.println();
		System.out.println("OrderDaoImpl minNbNum() start..");
		System.out.println("OrderDaoImpl minNbNum() o_order_num->"+o_order_num);
		int nb_num = 0;
		
		try {
			nb_num = session.selectOne("hrMinNbNum", o_order_num);
			System.out.println("OrderDaoImpl o_order_num -> "+ o_order_num);
			System.out.println("OrderDaoImpl nb_num -> "+ nb_num);
		} catch (Exception e) {
			System.out.println("OrderDaoImpl minNbNum() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl minNbNum() end..");
		return nb_num;
	}
	@Override
	public String selectNBTitleByNum(int nb_num) {
		System.out.println("OrderDaoImpl selectNBTitleByNum() start..");
		String title = "";
		try {
			title = session.selectOne("hrNBTitle", nb_num);
			System.out.println("OrderDaoImpl NB title -> "+ title);
		} catch (Exception e) {
			System.out.println("OrderDaoImpl selectNBTitleByNum() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectNBTitleByNum() end..");
		return title;
	}
	@Override
	public String selectOBTitleByNum(int nb_num) {
		System.out.println("OrderDaoImpl selectOBTitleByNum() start..");
		String title = "";
		try {
			title = session.selectOne("hrOBTitle", nb_num);
			System.out.println("OrderDaoImpl OB title -> "+ title);
		} catch (Exception e) {
			System.out.println("OrderDaoImpl selectOBTitleByNum() e.getMessage() -> "+e.getMessage());
		}
		System.out.println("OrderDaoImpl selectOBTitleByNum() end..");
		return title;
	}
	
	// BO 주문상세
	// boOrderDetail.jsp
	@Override
	public Orderr selectOrderr(int o_order_num) {
		System.out.println("OrderDaoImpl selectOrderr() start..");
		System.out.println("OrderDaoImpl selectOrderr() end..");
		return null;
	}



}
