package com.choongang.s202350103.gbService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.gbDao.NewBookDao;
import com.choongang.s202350103.model.NewBook;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NewBookServiceImpl implements NewBookService {

	private final NewBookDao nbd;
	
	@Override
	public List<NewBook> selectInNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookList");
		List<NewBook> listInNewbook = nbd.selectInNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectInNewBookList listInNewbook.size()->"+listInNewbook.size());
		
		return listInNewbook;
	}

	@Override
	public int selectInNewBookCnt(int category2) {
		System.out.println("NewBookServiceImpl selectInNewBookCnt start...");
		int inNewbookCnt = nbd.selectInNewBookCnt(category2);
		System.out.println("NewBookServiceImpl selectInNewBookCnt inNewbookCnt -> "+inNewbookCnt);
		return inNewbookCnt;
	}

	@Override
	public int selectSearchNewBookCnt(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectSearchNewBookCnt start...");
		int searchNewbookCnt = nbd.selectSearchNewBookCnt(newbook);
		System.out.println("NewBookServiceImpl selectSearchNewBookCnt searchNewbookCnt -> "+searchNewbookCnt);
		return searchNewbookCnt;
	}

	@Override
	public List<NewBook> selectSearchNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectSearchNewBookList start...");
		List<NewBook> listSearchNewbook = nbd.selectSearchNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectSearchNewBookList listSearchNewbook.size()->"+listSearchNewbook.size());
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectNewBookDetail(int nb_num) {
		System.out.println("NewBookServiceImpl selectNewBookDetail start...");
		NewBook selectNewbook = nbd.selectNewBookDetail(nb_num);
		
		return selectNewbook;
	}

}
