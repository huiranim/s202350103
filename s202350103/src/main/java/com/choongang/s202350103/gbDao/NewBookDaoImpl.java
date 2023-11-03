package com.choongang.s202350103.gbDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.NewBook;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NewBookDaoImpl implements NewBookDao { 
	private final SqlSession session;
	
	@Override
	public List<NewBook> selectInNewBookList(NewBook newbook) {
		List<NewBook> listInNewBook = null;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookList Start...");
		listInNewBook = session.selectList("gbSelectInNbList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookList listInNewBook.size() -> "+listInNewBook.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookList -> "+e.getMessage());
		}
		
		return listInNewBook;
	}

	@Override
	public int selectInNewBookCnt(int category2) {
		int inNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookCnt Start...");
			inNewbookCnt = session.selectOne("gbSelectInNbCnt", category2);
			System.out.println("NewBookDaoImpl selectInNewBookCnt inNewbookCnt");
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookCnt -> "+e.getMessage());
		}
		
		return inNewbookCnt;
	}

	@Override
	public int selectSearchNewBookCnt(NewBook newbook) {
		int searchNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt Start...");
			searchNewbookCnt = session.selectOne("gbSelectSearchNbCnt", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt searchNewbookCnt -> "+searchNewbookCnt);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt -> "+e.getMessage());
		}
		
		return searchNewbookCnt;
	}

	@Override
	public List<NewBook> selectSearchNewBookList(NewBook newbook) {
		List<NewBook> listSearchNewbook = null;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookList Start...");
			listSearchNewbook = session.selectList("gbSelectSearchBList", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookList listSearchNewbook.size() -> "+listSearchNewbook.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookList -> "+e.getMessage());
		}
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectNewBookDetail(int nb_num) {
		System.out.println("NewBookDaoImpl selectNewBookDetail Start...");
		NewBook selectNewbook = null;
		try {
			selectNewbook = session.selectOne("gbSelectNewBook", nb_num);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectNewBookDetail -> "+e.getMessage());
		}
		return selectNewbook;
	}

}

