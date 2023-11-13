package com.choongang.s202350103.sjService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.OldBook;
import com.choongang.s202350103.sjDao.OldBookDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OldBookServiceImpl implements OldbookService {
		
	private final OldBookDao obd;

	@Override
	public int totalOb() {
		System.out.println("OldBookServiceImpl start total..");

		int totObCnt = obd.totalOb();
		System.out.println("OldBookServiceImpl totalOb totObCnt->"+totObCnt);
			
		return totObCnt;
	}
	
	
	@Override
	public int totalOb2() {
		
		System.out.println("OldBookServiceImpl start total..");

		int totObCnt2 = obd.totalOb2();
		System.out.println("OldBookServiceImpl totalOb2 totObCnt2->"+totObCnt2);
			
		return totObCnt2;
		
		
	}
	@Override
	public int totNbCnt3() {	
		System.out.println("OldBookServiceImpl start total..");
		int totNbCnt3 = obd.totNbCnt3();
		System.out.println("OldBookServiceImpl totalOb totNbCnt3->"+totNbCnt3);
			
		return totNbCnt3;
		
		
	}
	
	
	
	@Override
	public List<OldBook> listOb(OldBook oldBook) {
		List<OldBook> Oblist = null;
		System.out.println("OldBookServiceImpl listOb Start...");
		Oblist = obd.listOb(oldBook);
		System.out.println("OldBookServiceImpl listOb OldBooklist.size()"+Oblist.size());
		return Oblist;
	}

	@Override
	public OldBook detailOb(int ob_num) {
		System.out.println("OldBookServiceImpl detail...");
		
		OldBook oldBook = null;
		oldBook = obd.detailOb(ob_num);
		System.out.println("OldBookServiceImpl detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
		
		return oldBook;
	}

	@Override
	public int updateOb(OldBook oldBook) {
		System.out.println("sjServiceImpl update...");
		
		int updateCount = 0;
		
		updateCount = obd.updateOb(oldBook);
		System.out.println("sjServiceImpl update oldBook" +oldBook);
		
		return updateCount;
	}

	@Override 
	public int insertOldBook(OldBook oldBook) {
		int result = 0;
		System.out.println("sjServiceImpl insert start...");
		result = obd.insertOldBook(oldBook);
		
		
		
		return result;
	}

	@Override
	public List<OldBook> oldBookAcc() {
		List<OldBook> oldbookList =null;
		System.out.println("sjServiceImpl oldBookAcc start...");
		oldbookList = obd.oldBookAcc();
		System.out.println("sjServiceImpl oldbookList oldBook.size()->"+oldbookList.size());
		
		return oldbookList;
	}

	@Override
	public List<OldBook> listMoOb(OldBook oldBook) {
		List<OldBook> ObMolist = null;
		System.out.println("OldBookServiceImpl ObMolist Start...");
		ObMolist = obd.listMoOb(oldBook);
		System.out.println("OldBookServiceImpl ObMolist OldBooklist.size()"+ObMolist.size());
		return ObMolist;
	}

	@Override
	public OldBook ModetailNb(int nb_num) {
	System.out.println("OldBookServiceImpl detail...");
		
		OldBook oldBook = null;
		oldBook = obd.ModetailNb(nb_num);
		System.out.println("OldBookServiceImpl ModetailNb oldBook->"+oldBook);
		
		return oldBook;
	}

	@Override 
	public List<OldBook> listObFo(OldBook oldBook) {
		
			List<OldBook> OblistFo = null;
			System.out.println("OldBookServiceImpl listObFo Start...");
			OblistFo = obd.listObFo(oldBook);
			System.out.println("OldBookServiceImpl listObFo OldBooklist.size()->"+OblistFo.size());
			return OblistFo;
		}
	
	@Override
	public int updateObComp(OldBook oldBook) {
		System.out.println("sjServiceImpl updateObComp...");
		
		int updateCount = 0;
		
		updateCount = obd.updateObComp(oldBook);
		System.out.println("sjServiceImpl updateObComp oldBook" +oldBook);
		
		return updateCount;
	}


	}

	

