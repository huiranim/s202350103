package com.choongang.s202350103.htDao;

import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.Review;

public interface OrderrDao {
	int           orderTotal();
	List<NewBook> orderOne(NewBook newBook);
	List<Cart>    orderList(Cart cart, Member member);
}
