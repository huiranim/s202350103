package com.choongang.s202350103.hrDao;

import java.util.List;
import com.choongang.s202350103.model.Orderr;

public interface OrderDao {

	int 		 countOrderrList();
	List<Orderr> selectOrderrList(Orderr orderr);
	Orderr 		 selectOrderr(long o_order_num);
	int 		 statusCancellation(long o_order_num);

	
	

	
}
