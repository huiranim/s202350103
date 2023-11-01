package com.choongang.s202350103.hrDao;

import java.util.List;
import com.choongang.s202350103.model.Orderr;

public interface OrderDao {
	// BO 주문목록
	// boOrderList.jsp
	int 		 countOrderrList();
	List<Orderr> selectOrderrList(Orderr orderr);
	int 		 minNbNum(long o_order_num);
	String 		 selectNBTitleByNum(int nb_num);
	String 		 selectOBTitleByNum(int nb_num);
	Orderr 		 selectOrderr(long o_order_num);

	

	
}
