package com.choongang.s202350103.htService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.htDao.OrderrDao;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderrServiceImpl implements OrderrService {
	private final OrderrDao od;

	@Override
	public int orderTotal() {
		System.out.println("HtService orderTotal Start...");
		int total = od.orderTotal();
		System.out.println("Service orderTotal() total--> " + total);
		return total;
	}

	@Override
	public List<NewBook> orderOne(NewBook newBook) {
		System.out.println("HtService orderOne Start...");
		List<NewBook> orderOne = od.orderOne(newBook);
		return orderOne;
	}

	@Override
	public List<Cart> orderList(Cart cart, Member member) {
		System.out.println("HtService orderList Start...");
		List<Cart> orderList = od.orderList(cart, member);
		return orderList;
	}

	

}
