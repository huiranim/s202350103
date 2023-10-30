package com.choongang.s202350103.gbDao;

import java.util.List;

import com.choongang.s202350103.model.NewBook;

public interface NewBookDao {

	List<NewBook> selectInNewBookList(NewBook newbook);
	int 		  selectInNewBookCnt();
}
