package com.choongang.s202350103.gbService;

import java.util.List;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.WishList;

public interface NewBookService { 
	
	List<NewBook> 	selectInNewBookList(NewBook newbook);
	int 			selectInNewBookCnt(NewBook newbook);
	int 			selectSearchNewBookCnt(NewBook newbook);
	List<NewBook> 	selectSearchNewBookList(NewBook newbook);
	NewBook 		selectNewBookDetail(NewBook newbook);
	int 			updateReadCnt(int nb_num);
	int 			selectHitNbNum();
	int 			insertUpdateWish(WishList wishlist);
	int 			insertCart(Cart cart);
	void 			updateCartCount(Cart cart);
	void 			deleteCart(Cart cart);
	List<NewBook> selectSearchBoNewBookList(NewBook newbook);
	NewBook selectBoNewBookDetail(NewBook newbook);
	int updateBoNewbook(NewBook newbook);

}
