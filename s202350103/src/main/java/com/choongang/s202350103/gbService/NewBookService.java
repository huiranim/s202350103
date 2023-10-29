package com.choongang.s202350103.gbService;

import java.util.List;

import com.choongang.s202350103.model.NewBook;

public interface NewBookService {
	
	List<NewBook> selectInNewBookList(NewBook newbook);
	int selectInNewBookCnt();

}
