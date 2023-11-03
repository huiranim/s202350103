package com.choongang.s202350103.gbService;

import java.util.List;

import com.choongang.s202350103.model.NewBook;

public interface NewBookService {
	
	List<NewBook> 	selectInNewBookList(NewBook newbook);
	int 			selectInNewBookCnt(int category2);
	int 			selectSearchNewBookCnt(NewBook newbook);
	List<NewBook> 	selectSearchNewBookList(NewBook newbook);
	NewBook 		selectNewBookDetail(int nb_num);

}
