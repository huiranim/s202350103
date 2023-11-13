package com.choongang.s202350103.shDao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.PointList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointListDaoImpl implements PointListDao {
	
	private final SqlSession session;

	@Override
	public List<PointList> selectMemberPoint(int a_num) {
		System.out.println("PointListDao selectMemberPoint() Start..");
		List<PointList> memberPointList = null;
		try {
			memberPointList = session.selectList("shSelectMemberPoint",a_num);
		} catch (Exception e) {
			System.out.println("pointListDao selectMemberPoint() Exception ->"+e.getMessage());
		}
		return memberPointList;
	}

}
