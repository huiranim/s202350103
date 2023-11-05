package com.choongang.s202350103.gbDao;

import java.util.List;

import com.choongang.s202350103.model.NewBook;

public interface NewBookDao { 

	List<NewBook> 	selectInNewBookList(NewBook newbook);
	int 		  	selectInNewBookCnt(NewBook newbook);
	int 			selectSearchNewBookCnt(NewBook newbook);
	List<NewBook> 	selectSearchNewBookList(NewBook newbook);
	NewBook 		selectNewBookDetail(NewBook newbook);
	int 			updateReadCnt(int nb_num);
	int 			selectHitNbNum();
	int 			selectWishStatus(NewBook newbook);
	int 			InsertUpdateWish(NewBook newbook);
}
