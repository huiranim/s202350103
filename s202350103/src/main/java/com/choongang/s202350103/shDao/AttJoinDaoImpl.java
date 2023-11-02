package com.choongang.s202350103.shDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.AttJoin;
import com.choongang.s202350103.model.Attendance;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttJoinDaoImpl implements AttJoinDao {

	private final SqlSession session;
	
	@Override
	public List<AttJoin> listAttJoin(int m_num) {
		System.out.println("AttendanceDaoImpl listAttJoin() Start..");
		List<AttJoin> attJoinList = null;
		try {
			attJoinList = session.selectList("shAttJoinList",m_num);
		} catch (Exception e) {
			System.out.println("AttendanceDaoImpl listAttJoin() Exception ->"+e.getMessage());
		}
		return attJoinList;
	}
}

