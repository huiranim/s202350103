package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.PointList;

public interface PointListDao {

	List<PointList> selectMemberPoint(int a_num);

}
