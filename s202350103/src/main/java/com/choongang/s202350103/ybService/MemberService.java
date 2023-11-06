package com.choongang.s202350103.ybService;

import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.WishList;

public interface MemberService {

	Member			login(Member member1);

	int 			totalCart(Member member);

	List<Cart> 		listCart(Cart cart, Member member);

	int 			totalPrice(Member member);

	int 			totalWishList(Member member);

	List<WishList>  memberWishList(WishList wishList);

	Member 			memberWithdraw(Member member);

	Member 			memberChk(String chk_Id);


	


}
	