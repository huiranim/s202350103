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
			System.out.println("OldBookDaoImpl totalOb2 totObCnt->"+ totObCount);
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl totalOb2 Exception->"+e.getMessage());
		}
		
		
		return totObCount;
	}

	@Override
	public int totalOb2() {
		int totObCount2 =0;
		
		System.out.println("OldBookDaoImpl start totalOb2 ");
		try {
			totObCount2 = session.selectOne("totObCnt2");
			System.out.println("OldBookDaoImpl totalOb2 totObCnt2->"+ totObCount2);
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl totalOb2 Exception->"+e.getMessage());
		}
		
		
		return totObCount2;
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

	@Override  
	public int insertOldBook(OldBook oldBook) {
		int result = 0;
		
		System.out.println("OldBookDaoImpl insert start....");
		
		try {
			result = session.insert("insertOldBook", oldBook);
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl insert Exception->"+e.getMessage() );
		}

		return result;
	}

	@Override
	public List<OldBook> oldBookAcc() {
		List<OldBook> oldbookList =null;
		System.out.println("OldBookDaoImpl oldBookAcc start...");
		
		try {
			
			oldbookList = session.selectList("SelectAcc");
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl oldBookAcc Exception->"+e.getMessage());
		}
		
		return oldbookList;
	}

	@Override
	public List<OldBook> listMoOb(OldBook oldBook) {
		List<OldBook> obMoList = null;
		System.out.println("OldBookDaoImpl listOb start...");
		try {
			
			obMoList = session.selectList("sjObMoListAll", oldBook);
			System.out.println("OldBookDaoImpl listOb obList.size()"+obMoList.size());
			
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl listOb e.getMessage()->" +e.getMessage());
		}
		return obMoList;
	}

	@Override
	public OldBook ModetailNb(int nb_num) {
		System.out.println("OldBookDaoImpl ModetailNb start...");
		System.out.println("OldBookDaoImpl ModetailNb ob_num->"+nb_num);
		OldBook oldBook = new OldBook();
		
		try {
			oldBook = session.selectOne("sjObSelNb" , nb_num);
			System.out.println("OldBookDaoImpl ModetailNb getOb_pur_price()->"+oldBook.getOb_pur_price());
			
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl ModetailNb Exception->"+e.getMessage());
		}
		
		return oldBook;
	}

	@Override
	public List<OldBook> listObFo(OldBook oldBook) {
		List<OldBook> OblistFo = null;
		System.out.println("OldBookDaoImpl listObFo start...");
		try {
			
			OblistFo = session.selectList("sjObListAll", oldBook);
			System.out.println("OldBookDaoImpl listObFo obList.size()"+OblistFo.size());
			
			
		} catch (Exception e) {
			System.out.println("OldBookDaoImpl listObFo e.getMessage()->" +e.getMessage());
		}
		
		
		return OblistFo;
	}

	@Override
	public int updateObComp(OldBook oldBook) {
		System.out.println("sjDaoImpl updateObComp Start...");
		int updateCount = 0;
		try {
			updateCount = session.update("sjObUpdateComple",oldBook);
			System.out.println("OldBookDaoImpl oldBook..."+oldBook);
			System.out.println("OldBookDaoImpl updateCount..."+updateCount);
		} catch (Exception e) {
			System.out.println("sjDaoImpl updateObComp Exception->"+e.getMessage());
		}

		return updateCount;
	}



	


	
	
	
	
}
