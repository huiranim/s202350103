package com.choongang.s202350103.shDao;

import java.util.List;

import com.choongang.s202350103.model.AttJoin;

public interface AttJoinDao {

	List<AttJoin> 	 listAttJoin(AttJoin attJoin);
	List<AttJoin> 	 subDate(AttJoin attJoin);
	int 			 stampAtt(AttJoin attJoin);
	int 			 savePoint(AttJoin attJoin);
	int 			 checkChance(AttJoin attJoin);
}
