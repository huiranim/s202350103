package com.choongang.s202350103.gbDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Orderr;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointChargeDao {
	
	private final SqlSession session;
	
	public int InsertPointCharge(Orderr orderr) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
