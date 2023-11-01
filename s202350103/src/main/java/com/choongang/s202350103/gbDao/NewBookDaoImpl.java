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
	public int selectInNewBookCnt() {
		int inNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookCnt Start...");
			inNewbookCnt = session.selectOne("gbSelectInNbCnt");
			System.out.println("NewBookDaoImpl selectInNewBookCnt inNewbookCnt");
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookCnt -> "+e.getMessage());
		}
		
		return inNewbookCnt;
	}

	@Override
	public int selectInNewBookEcoCnt() {
		
		System.out.println("NewBookDaoImpl selectInNewBookEcoCnt start...");
		int ineconmyCnt = session.selectOne("gbSelectInNbEcoCnt");
		System.out.println("NewBookDaoImpl selectInNewBookEcoCnt ineconmyCnt -> "+ineconmyCnt);
		return ineconmyCnt;
	}

	@Override
	public List<NewBook> selectInNewBookEcoList(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectInNewBookEcoList start...");
		List<NewBook> listInNewbookEco = session.selectList("gbSelectInNbEcoList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookEcoList listInNewbookEco.size() -> "+listInNewbookEco.size());
		return listInNewbookEco;
	}

	@Override
	public int selectInNewBookSciCnt() {
		System.out.println("NewBookDaoImpl selectInNewBookSciCnt start...");
		int inscienceCnt = session.selectOne("gbSelectInNbSciCnt");
		System.out.println("NewBookDaoImpl selectInNewBookSciCnt inscienceCnt -> "+inscienceCnt);
		return inscienceCnt;
	}

	@Override
	public List<NewBook> selectInNewBookSciList(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectInNewBookSciList start...");
		List<NewBook> listInNewbookSci = session.selectList("gbSelectInNbSciList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookSciList listInNewbookSci.size() -> "+listInNewbookSci.size());
		return listInNewbookSci;
	}

	@Override
	public int selectInNewBookNovCnt() {
		System.out.println("NewBookDaoImpl selectInNewBookNovCnt start...");
		int innovelCnt = session.selectOne("gbSelectInNbNovCnt");
		System.out.println("NewBookDaoImpl selectInNewBookNovCnt innovelCnt -> "+innovelCnt);
		return innovelCnt;
	}

	@Override
	public List<NewBook> selectInNewBookNovList(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectInNewBookNovList start...");
		List<NewBook> listInNewbookNov = session.selectList("gbSelectInNbNovList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookNovList listInNewbookNov.size() -> "+listInNewbookNov.size());
		return listInNewbookNov;
	}

	@Override
	public int selectInNewBookHisCnt() {
		System.out.println("NewBookDaoImpl selectInNewBookHisCnt start...");
		int inhistoryCnt = session.selectOne("gbSelectInNbHisCnt");
		System.out.println("NewBookDaoImpl selectInNewBookHisCnt inhistoryCnt -> "+inhistoryCnt);
		return inhistoryCnt;
	}

	@Override
	public List<NewBook> selectInNewBookHisList(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectInNewBookHisList start...");
		List<NewBook> listInNewbookHis = session.selectList("gbSelectInNbHisList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookHisList listInNewbookHis.size() -> "+listInNewbookHis.size());
		return listInNewbookHis;
	}

	@Override
	public int selectInNewBookHumCnt() {
		System.out.println("NewBookDaoImpl selectInNewBookHumCnt start...");
		int inhumanCnt = session.selectOne("gbSelectInNbHumCnt");
		System.out.println("NewBookDaoImpl selectInNewBookHumCnt inhumanCnt -> "+inhumanCnt);
		return inhumanCnt;
	}

	@Override
	public List<NewBook> selectInNewBookHumList(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectInNewBookHumList start...");
		List<NewBook> listInNewbookHum = session.selectList("gbSelectInNbHumList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookHumList listInNewbookHum.size() -> "+listInNewbookHum.size());
		return listInNewbookHum;
	}
}

