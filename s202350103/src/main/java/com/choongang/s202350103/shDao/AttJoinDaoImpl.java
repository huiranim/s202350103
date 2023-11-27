package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.AttJoin;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttJoinDaoImpl implements AttJoinDao {

	private final SqlSession session;
	
	@Override
	public List<AttJoin> listAttJoin(AttJoin attJoin) {
		System.out.println("AttJoinDaoImpl listAttJoin() Start..");
		List<AttJoin> attJoinList = null;
		System.out.println("m_num->"+ attJoin.getM_num());
	    System.out.println("a_num->"+ attJoin.getA_num());
		try {
			attJoinList = session.selectList("shAttJoinList",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDaoImpl listAttJoin() Exception ->"+e.getStackTrace());
		}
		return attJoinList;
	}

	@Override
	public List<AttJoin> subDate(AttJoin attJoin) {
		List<AttJoin> dateList = null;
		try {
			dateList = session.selectList("shSubDate",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao subDate() Exception ->"+e.getMessage());
		}
		return dateList;
	}
	
	@Override
	public int checkChance(AttJoin attJoin) {
		int chance = 0;
		try {
			chance = session.selectOne("shCheckAttChance",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao checkChance() Exception->"+e.getMessage());
		}
		return chance;
	}	

	@Override
	public int stampAtt(AttJoin attJoin) {
		int result = 0 ;
		try {
			result = session.insert("shStampAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDaoImpl StampAtt() Exception->"+e.getMessage());
		}
		return result;
	}
	
	@Override
	public int savePoint(AttJoin attJoin) {
		int point = 0;
		try {
			point = session.update("shSaveAttPoint",attJoin);
		} catch (Exception e) {
			System.out.println("AttendanceDaoImpl savePoint() Exception->"+e.getMessage());
		} 
		return point;
	}

	@Override
	public AttJoin searchAtt(AttJoin attJoin) {
		try {
			attJoin = session.selectOne("shSearchAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao searchAtt() Exception->"+e.getMessage());
		}
		return attJoin;
	}	
	
	@Override
	public void attPointList(AttJoin attJoin) {
		try {
			session.insert("shAttPointList",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao attPointList() Exception->"+e.getMessage());
		}
	}

	@Override
	public int addAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		int count = 0;
		try {
			count = session.selectOne("shAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao addAtt() Exception->"+e.getMessage());
		}
		return count;
	}

	@Override
	public void stampAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao stampAddAtt() Start..");
		try {
			session.insert("shStampAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao stampAddAtt() Exception->"+e.getMessage());
		}
	}
	
	@Override
	public void saveAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		try {
			session.update("shSaveAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao saveAddAtt() Exception->"+e.getMessage());
		}
	}

	@Override
	public void searchAddAtt(AttJoin attJoin) {
		System.out.println("AttJoinDao addAtt() Start..");
		try {
			session.insert("shSearchAddAtt",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao searchAddAtt() Exception->"+e.getMessage());
		}
	}

	@Override
	public int countAttRow(AttJoin attJoin) {
		System.out.println("AttJoinDao countAttRow() Start..");
		int rowCount = 0;
		try {
			rowCount = session.selectOne("shCountAttRow",attJoin);
		} catch (Exception e) {
			System.out.println("AttJoinDao countAttRow() Exception->"+e.getMessage());
		}
		return rowCount;
	}

}

