package com.choongang.s202350103.sjDao;

import java.util.List;

import com.choongang.s202350103.model.OldBook;

public interface OldBookDao {

	int 			    totalOb();
	List<OldBook> 	    listOb(OldBook oldBook);
	OldBook             detailOb(int ob_num);
	int                 updateOb(OldBook oldBook);
	int 				insertOldBook(OldBook oldBook);
	List<OldBook>       oldBookAcc();
	List<OldBook>       listMoOb(OldBook oldBook);
	OldBook             ModetailNb(int nb_num);
 
	 
	 
	
}
