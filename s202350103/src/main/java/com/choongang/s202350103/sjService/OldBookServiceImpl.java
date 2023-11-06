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
	public List<OldBook> listOb(OldBook oldBook) {
		List<OldBook> Oblist = null;
		System.out.println("OldBookServiceImpl listManager Start...");
		Oblist = obd.listOb(oldBook);
		System.out.println("OldBookServiceImpl listManager OldBooklist.size()"+Oblist.size());
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
	
	
	
}
