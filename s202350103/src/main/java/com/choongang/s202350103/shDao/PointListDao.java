package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;

public interface PointListDao {

	List<PointList> selectMemberPoint(Member member);
	int 			pointSum(int m_num);
	int 			boUpdatePlusPoint(Member member);
	int 			boInsertPlusPoint(Member member);
	int 			boInsertMinusPoint(Member member);
	int 			boUpdateMinusPoint(Member member);
	List<PointList> boJoinedMember(int eNum);
	int 			memberPointList(int m_num);
	int 			joinedCount(int eNum);

}
