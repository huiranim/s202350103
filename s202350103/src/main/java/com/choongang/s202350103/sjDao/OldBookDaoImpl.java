package com.choongang.s202350103.sjDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.OldBook;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OldBookDaoImpl implements OldBookDao {

	private final SqlSession session;

	@Override
	public int totalOb() {
		int totObCount =0;
		
		System.out.println("OldBookDaoImpl start total ");
		try {
			totObCount = session.selectOne("totObCnt");
			System.out.println("OldBookDaoImpl totalEmp totObCnt"+ totObCount);
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl totalEmp Exception->"+e.getMessage());
		}
		
		
		return totObCount;
	}

	@Override
	public List<OldBook> listOb(OldBook oldBook) {
		List<OldBook> obList = null;
		System.out.println("OldBookDaoImpl listOb start...");
		try {
			
			obList = session.selectList("sjObListAll2", oldBook);
			System.out.println("OldBookDaoImpl listOb obList.size()"+obList.size());
			
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl listOb e.getMessage()->" +e.getMessage());
		}
		
		
		return obList;
	}

	@Override
	public OldBook detailOb(int ob_num) {
		System.out.println("OldBookDaoImpl detailOb start...");
		System.out.println("OldBookDaoImpl detailOb ob_num->"+ob_num);
		OldBook oldBook = new OldBook();
		
		try {
			oldBook = session.selectOne("sjObSelOne" , ob_num);
			System.out.println("OldBookDaoImpl detailOb getOb_pur_price()->"+oldBook.getOb_pur_price());
			
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl detailOb Exception->"+e.getMessage());
		}
		
		return oldBook;
	}

	@Override
	public int updateOb(OldBook oldBook) {
		System.out.println("sjDaoImpl update Start...");
		int updateCount = 0;
		
		try {
			updateCount = session.update("sjObUpdate",oldBook);
			System.out.println("OldBookDaoImpl oldBook..."+oldBook);
			System.out.println("OldBookDaoImpl updateCount..."+updateCount);
		} catch (Exception e) {
			System.out.println("sjDaoImpl updateOb Exception->"+e.getMessage());
		}
		
		
		return updateCount;
	}


	
	
	
	
}
