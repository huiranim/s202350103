package com.choongang.s202350103.gbService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.gbDao.NewBookDao;
import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor 
public class NewBookServiceImpl implements NewBookService {

	private final NewBookDao nbd;
	
	@Override
	public List<NewBook> selectInNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookList");
		List<NewBook> listInNewbook = nbd.selectInNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectInNewBookList listInNewbook.size()->"+listInNewbook.size());
		
		return listInNewbook;
	}

	@Override
	public int selectInNewBookCnt(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectInNewBookCnt start...");
		int inNewbookCnt = nbd.selectInNewBookCnt(newbook);
		System.out.println("NewBookServiceImpl selectInNewBookCnt inNewbookCnt -> "+inNewbookCnt);
		return inNewbookCnt;
	}

	@Override
	public int selectSearchNewBookCnt(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectSearchNewBookCnt start...");
		int searchNewbookCnt = nbd.selectSearchNewBookCnt(newbook);
		System.out.println("NewBookServiceImpl selectSearchNewBookCnt searchNewbookCnt -> "+searchNewbookCnt);
		return searchNewbookCnt;
	}

	@Override
	public List<NewBook> selectSearchNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectSearchNewBookList start...");
		List<NewBook> listSearchNewbook = nbd.selectSearchNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectSearchNewBookList listSearchNewbook.size()->"+listSearchNewbook.size());
		System.out.println("NewBookServiceImpl selectSearchNewBookList listSearchNewbook.w_wish -> "+listSearchNewbook.get(0).getW_wish());
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectNewBookDetail(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectNewBookDetail start...");
		NewBook selectNewbook = nbd.selectNewBookDetail(newbook);
		
		return selectNewbook;
	}

	@Override
	public int updateReadCnt(int nb_num) {
		System.out.println("NewBookServiceImpl updateReadCnt start...");
		int result = nbd.updateReadCnt(nb_num);
		System.out.println("NewBookServiceImpl updateReadCnt result->"+result);
		
		return result;
	}

	@Override
	public int selectHitNbNum() {
		System.out.println("NewBookServiceImpl selectHitNbNum start...");
		int hit_nb_num = nbd.selectHitNbNum();
		
		return hit_nb_num;
	}

	@Override
	public int insertUpdateWish(WishList wishlist) {
		System.out.println("NewBookServiceImpl insertUpdateWish start...");
		
		// wishStaus(찜 여부) 가 널이면 insert, notnull이면 update
		int result = nbd.InsertUpdateWish(wishlist);
		
		// 찜상태 변경 후 찜여부 확인하기
		int wishStatus = nbd.selectWishStatus(wishlist);
		System.out.println("NewBookServiceImpl insertUpdateWish result ->" + wishStatus);
		
		return wishStatus;
	}

	@Override
	public int insertCart(Cart cart) {
		System.out.println("NewBookServiceImpl insertCart start...");
		
		// 장바구니에 담기
		int result = nbd.insertCart(cart);
		System.out.println("NewBookServiceImpl insertCart result->"+result);
		
		return result;
	}

	@Override
	public void updateCartCount(Cart cart) {
		System.out.println("NewBookServiceImpl updateCartCount start...");
		// 장바구니 화면에 수량 수정하기
		nbd.updateCartCount(cart);
		
	}

	@Override
	public void deleteCart(Cart cart) {
		System.out.println("NewBookServiceImpl updateCartCount start...");
		// 장바구니 화면에 상품 삭제하기
		nbd.deleteCart(cart);
		
	}

	@Override
	public List<NewBook> selectSearchBoNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectSearchBoNewBookList start...");
		List<NewBook> listSearchNewbook = nbd.selectSearchBoNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectSearchBoNewBookList listSearchNewbook.size()->"+listSearchNewbook.size());
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectBoNewBookDetail(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectBoNewBookDetail start...");
		// 관리자페이지 상품 상세페이지 값 가져오기
		NewBook bonewbook = nbd.selectBoNewBookDetail(newbook);
		
		return bonewbook;
	}

	@Override
	public int updateBoNewbook(NewBook newbook) {
		System.out.println("NewBookServiceImpl updateBoNewbook start...");
		int result = nbd.updateBoNewbook(newbook);
		System.out.println("NewBookServiceImpl updateBoNewbook result ->"+result);
		return result;
	}

	@Override
	public List<NewBook> selectBoNewBookList(NewBook newbook) {
		System.out.println("NewBookServiceImpl selectBoNewBookList start...");
		List<NewBook> listBoNewbook = nbd.selectBoNewBookList(newbook);
		System.out.println("NewBookServiceImpl selectBoNewBookList listBoNewbook.size()->"+listBoNewbook.size());
		
		return listBoNewbook;
	}

	@Override
	public int deleteBoNewbook(int nb_num) {
		System.out.println("NewBookServiceImpl deleteBoNewbook start...");
		int result = nbd.deleteBoNewbook(nb_num);
		System.out.println("NewBookServiceImpl deleteBoNewbook result ->"+result);
		return result;
	}

	@Override
	public int insertBoNewbook(NewBook newbook) {
		System.out.println("NewBookServiceImpl insertBoNewbook start...");
		int result = nbd.insertBoNewbook(newbook);
		System.out.println("NewBookServiceImpl insertBoNewbook result ->"+result);
		return result;
	}


}
