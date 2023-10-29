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
		
		System.out.println("NewBookDaoImpl selectInNewBookList Start...");
		List<NewBook> listInNewBook = session.selectList("gbSelectInNbList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookList listInNewBook.size() -> "+listInNewBook.size());
		
		return listInNewBook;
	}

	@Override
	public int selectInNewBookCnt() {
		System.out.println("NewBookDaoImpl selectInNewBookCnt Start...");
		int inNewbookCnt = session.selectOne("gbSelectInNbCnt");
		System.out.println("NewBookDaoImpl selectInNewBookCnt inNewbookCnt");
		return inNewbookCnt;
	}
}

