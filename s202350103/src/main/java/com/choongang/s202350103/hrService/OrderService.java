package com.choongang.s202350103.hrService;

import java.util.List;
import com.choongang.s202350103.model.Orderr;

public interface OrderService {
	// BO 주문목록
	// boOrderList.jsp
	int 		 countOrderrList();
	List<Orderr> selectOrderrList(Orderr orderr);
	Orderr 		 selectOrderr(int o_order_num);


	
}
