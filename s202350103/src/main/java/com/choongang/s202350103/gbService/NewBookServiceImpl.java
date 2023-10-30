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
	public int selectInNewBookCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookCnt start...");
		int inNewbookCnt = nbd.selectInNewBookCnt();
		System.out.println("NewBookServiceImpl selectInNewBookCnt inNewbookCnt -> "+inNewbookCnt);
		return inNewbookCnt;
	}

	@Override
	public int selectInNewBookEcoCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookEcoCnt start...");
		int ineconmyCnt = nbd.selectInNewBookEcoCnt();
		System.out.println("NewBookServiceImpl selectInNewBookEcoCnt ineconmyCnt-> "+ineconmyCnt);
		return ineconmyCnt;
	}

	@Override
	public List<NewBook> selectInNewBookEcoList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookEcoList start...");
		List<NewBook> listInNewbookEco = nbd.selectInNewBookEcoList(newbook);
		System.out.println("NewBookDaoImpl selectInNewBookEcoList listInNewbookEco.size() -> "+listInNewbookEco.size());
		return listInNewbookEco;
	}

	@Override
	public int selectInNewBookSciCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookSciCnt start...");
		int inscienceCnt = nbd.selectInNewBookSciCnt();
		System.out.println("NewBookServiceImpl selectInNewBookSciCnt inscienceCnt-> "+inscienceCnt);
		return inscienceCnt;
	}

	@Override
	public List<NewBook> selectInNewBookSciList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookSciList start...");
		List<NewBook> listInNewbookSci = nbd.selectInNewBookSciList(newbook);
		System.out.println("NewBookDaoImpl selectInNewBookSciList listInNewbookSci.size() -> "+listInNewbookSci.size());
		return listInNewbookSci;
	}

	@Override
	public int selectInNewBookNovCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookNovCnt start...");
		int innovelCnt = nbd.selectInNewBookNovCnt();
		System.out.println("NewBookServiceImpl selectInNewBookNovCnt innovelCnt-> "+innovelCnt);
		return innovelCnt;
	}

	@Override
	public List<NewBook> selectInNewBookNovList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookNovList start...");
		List<NewBook> listInNewbookNov = nbd.selectInNewBookNovList(newbook);
		System.out.println("NewBookDaoImpl selectInNewBookNovList listInNewbookNov.size() -> "+listInNewbookNov.size());
		return listInNewbookNov;
	}

	@Override
	public int selectInNewBookHisCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookHisCnt start...");
		int inhistoryCnt = nbd.selectInNewBookHisCnt();
		System.out.println("NewBookServiceImpl selectInNewBookHisCnt inhistoryCnt-> "+inhistoryCnt);
		return inhistoryCnt;
	}

	@Override
	public List<NewBook> selectInNewBookHisList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookHisList start...");
		List<NewBook> listInNewbookHis = nbd.selectInNewBookHisList(newbook);
		System.out.println("NewBookDaoImpl selectInNewBookHisList listInNewbookHis.size() -> "+listInNewbookHis.size());
		return listInNewbookHis;
	}

	@Override
	public int selectInNewBookHumCnt() {
		System.out.println("NewBookServiceImpl selectInNewBookHumCnt start...");
		int inhumanCnt = nbd.selectInNewBookHumCnt();
		System.out.println("NewBookServiceImpl selectInNewBookHumCnt inhumanCnt-> "+inhumanCnt);
		return inhumanCnt;
	}

	@Override
	public List<NewBook> selectInNewBookHumList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookHumList start...");
		List<NewBook> listInNewbookHum = nbd.selectInNewBookHumList(newbook);
		System.out.println("NewBookDaoImpl selectInNewBookHumList listInNewbookHum.size() -> "+listInNewbookHum.size());
		return listInNewbookHum;
	}

}
