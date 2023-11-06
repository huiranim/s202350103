package com.choongang.s202350103.sjService;

import java.util.List;

import com.choongang.s202350103.model.OldBook;

public interface OldbookService {

	int 				 totalOb();
	List<OldBook>		 listOb(OldBook oldBook);
	OldBook				 detailOb(int ob_num);
	int 				 updateOb(OldBook oldBook);
	
		 
		
}
