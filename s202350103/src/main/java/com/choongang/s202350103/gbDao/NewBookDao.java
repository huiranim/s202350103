package com.choongang.s202350103.gbDao;

import java.util.List;

import com.choongang.s202350103.model.NewBook;

public interface NewBookDao {

	List<NewBook> 	selectInNewBookList(NewBook newbook);
	int 		  	selectInNewBookCnt();
	int 			selectInNewBookEcoCnt();
	List<NewBook> 	selectInNewBookEcoList(NewBook newbook);
	int 			selectInNewBookSciCnt();
	List<NewBook> 	selectInNewBookSciList(NewBook newbook);
	int 			selectInNewBookNovCnt();
	List<NewBook> 	selectInNewBookNovList(NewBook newbook);
	int 			selectInNewBookHisCnt();
	List<NewBook> 	selectInNewBookHisList(NewBook newbook);
	int 			selectInNewBookHumCnt();
	List<NewBook> 	selectInNewBookHumList(NewBook newbook);
}
