package com.choongang.s202350103.gbService;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.gbDao.NewBookOldBookDao;
import com.choongang.s202350103.gbDao.PointChargeDao;
import com.choongang.s202350103.model.Orderr;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointChargeService {
	private PointChargeDao pcd;
	
	public int InsertPointCharge(Orderr orderr) {
		System.out.println("PointChargeService InsertPointCharge start...");
		int result = 0;
		
		result = pcd.InsertPointCharge(orderr);
		System.out.println("PointChargeService InsertPointCharge result -> "+result);
		return result;
	}
}
