package com.choongang.s202350103.ybDao;


import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;

public interface MemberDao {
	Member			login(Member member1);

	int 			totalCart(Member member);

	List<Cart> 		listCart(Cart cart, Member member);

	int 			totalPrice(Member member);

}
