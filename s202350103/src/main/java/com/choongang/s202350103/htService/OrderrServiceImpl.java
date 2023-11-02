package com.choongang.s202350103.htService;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.htDao.OrderrDao;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderrServiceImpl implements OrderrService {
	private final OrderrDao od;

	@Override
	public int orderTotal() {
		System.out.println("Service orderTotal Start...");
		int total = od.orderTotal();
		System.out.println("Service orderTotal() total--> " + total);
		return total;
	}


}
