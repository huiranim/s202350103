package com.choongang.s202350103.shDao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PointListDaoImpl implements PointListDao {
	
	private final SqlSession session;

	@Override
	public List<PointList> selectMemberPoint(int m_num) {
		System.out.println("PointListDao selectMemberPoint() Start..");
		List<PointList> memberPointList = null;
		try {
			memberPointList = session.selectList("shSelectMemberPoint",m_num);
		} catch (Exception e) {
			System.out.println("pointListDao selectMemberPoint() Exception ->"+e.getMessage());
		}
		return memberPointList;
	}

	@Override
	public int pointSum(int m_num) {
		System.out.println("PointListDao pointSum() Start..");
		int sum = 0;
		 try {
			sum = session.selectOne("shPointSum",m_num);
		} catch (Exception e) {
			System.out.println("pointListDao pointSum() Exception ->"+e.getMessage());
		}
		return sum;
	}

	@Override
	public int boUpdatePlusPoint(Member member) {
		System.out.println("PointList boUpdatePlusPoint() Start..");
		int updateResult = 0;
		try {
			updateResult = session.update("shBoUpdatePlusPoint",member);
		} catch (Exception e) {
			System.out.println("pointListDao boUpdatePlusPoint() Exception ->"+e.getMessage());
		}
		return updateResult;
	}

	@Override
	public int boInsertPlusPoint(Member member) {
		System.out.println("PointList boInsertPlusPoint() Start..");
		int insertResult = 0;
		try {
			insertResult = session.insert("shBoInsertPlusPoint",member);
		} catch (Exception e) {
			System.out.println("pointListDao boInsertPlusPoint() Exception ->"+e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int boInsertMinusPoint(Member member) {
		System.out.println("PointList boInsertMinusPoint() Start..");
		int insertResult = 0;
		try {
			insertResult = session.insert("shBoInsertMinusPoint",member);
		} catch (Exception e) {
			System.out.println("PointListDao boInsertMinusPoint() Exception->"+e.getMessage());
		}
		return insertResult;
	}

	@Override
	public int boUpdateMinusPoint(Member member) {
		System.out.println("PointList boUpdateMinusPoint() Start..");
		int updateResult = 0;
		try {
			updateResult = session.update("shBoUpdateMinusPoint",member);
		} catch (Exception e) {
			System.out.println("PointListDao boUpdateMinusPoint() Exception->"+e.getMessage());
		}
		return updateResult;
	}

	@Override
	public List<PointList> boJoinedMember(int eNum) {
		System.out.println("PointList boJoinedMember() Start...");
		List<PointList> pointList = null;
		try {
			pointList = session.selectList("boBoJoinedMember", eNum);
		} catch (Exception e) {
			System.out.println("PointList boJoinedMember() Exception->"+e.getMessage());
		}
		return pointList;
	}

}
