package com.choongang.s202350103.gbDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.NewBook;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NewBookDaoImpl implements NewBookDao { 
	private final SqlSession session;
	
	@Override
	public List<NewBook> selectInNewBookList(NewBook newbook) {
		List<NewBook> listInNewBook = null;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookList Start...");
		listInNewBook = session.selectList("gbSelectInNbList", newbook);
		System.out.println("NewBookDaoImpl selectInNewBookList listInNewBook.size() -> "+listInNewBook.size());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookList -> "+e.getMessage());
		}
		
		return listInNewBook;
	}

	@Override
	public int selectInNewBookCnt(NewBook newbook) {
		int inNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectInNewBookCnt Start...");
			inNewbookCnt = session.selectOne("gbSelectInNbCnt", newbook);
			System.out.println("NewBookDaoImpl selectInNewBookCnt inNewbookCnt");
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectInNewBookCnt -> "+e.getMessage());
		}
		
		return inNewbookCnt;
	}

	@Override
	public int selectSearchNewBookCnt(NewBook newbook) {
		int searchNewbookCnt = 0;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt Start...");
			searchNewbookCnt = session.selectOne("gbSelectSearchNbCnt", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt searchNewbookCnt -> "+searchNewbookCnt);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookCnt -> "+e.getMessage());
		}
		
		return searchNewbookCnt;
	}

	@Override
	public List<NewBook> selectSearchNewBookList(NewBook newbook) {
		List<NewBook> listSearchNewbook = null;
		try {
			System.out.println("NewBookDaoImpl selectSearchNewBookList Start...");
			listSearchNewbook = session.selectList("gbSelectSearchBList", newbook);
			System.out.println("NewBookDaoImpl selectSearchNewBookList listSearchNewbook.size() -> "+listSearchNewbook.size());
			System.out.println("NewBookDaoImpl selectSearchNewBookList listSearchNewbook.w_wish -> "+listSearchNewbook.get(0).getW_wish());
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectSearchNewBookList -> "+e.getMessage());
		}
		
		return listSearchNewbook;
	}

	@Override
	public NewBook selectNewBookDetail(NewBook newbook) {
		System.out.println("NewBookDaoImpl selectNewBookDetail Start...");
		NewBook selectNewbook = null;
		try {
			selectNewbook = session.selectOne("gbSelectNewBook", newbook);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectNewBookDetail -> "+e.getMessage());
		}
		return selectNewbook;
	}

	@Override
	public int updateReadCnt(int nb_num) {
		System.out.println("NewBookDaoImpl updateReadCnt Start...");
		int result = 0;
		try {
			result = session.update("gbUpdateReadCnt", nb_num);
			System.out.println("NewBookDaoImpl selectNewBookDetail result->"+result);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl updateReadCnt -> "+e.getMessage());
		}
		
		return result;
	}

	@Override
	public int selectHitNbNum() {
		System.out.println("NewBookDaoImpl selectHitNbNum Start...");
		int hit_nb_num = 0;
		
		try {
			hit_nb_num = session.selectOne("gbSelectHitNbNum");
			System.out.println("NewBookDaoImpl selectNewBookDetail hit_nb_num->"+hit_nb_num);
		} catch (Exception e) {
			System.out.println("NewBookDaoImpl selectHitNbNum -> "+e.getMessage());
		}
		
		return hit_nb_num;
	}

	@Override
	public int selectWishStatus(WishList wishlist) {
		System.out.println("NewBookDaoImpl selectWishStatus start...");
		int wishStatus = session.selectOne("gbselectWishStatus", wishlist);
		System.out.println("NewBookDaoImpl selectWishStatus wishStatus -> "+wishStatus);
		return wishStatus;
	}

	@Override
	public int InsertUpdateWish(WishList wishlist) {
		System.out.println("NewBookDaoImpl InsertUpdateWish start...");
		int result = session.insert("gbInsertUpdateWish", wishlist);
		System.out.println("NewBookDaoImpl InsertUpdateWish result->"+result);
		return result;
	}

	@Override
	public int insertCart(Cart cart) {
		int result = 0;
		System.out.println("NewBookDaoImpl insertCart start...");
		result = session.insert("gbInsertCart", cart);
		System.out.println("NewBookDaoImpl insertCart cart->"+result);
		return result;
	}

	@Override
	public void updateCartCount(Cart cart) {
		System.out.println("NewBookDaoImpl updateCartCount start...");
		session.update("gbUpdateCartCount", cart);	
	}

	@Override
	public void deleteCart(Cart cart) {
		System.out.println("NewBookDaoImpl updateCartCount start...");
		session.delete("gbDeleteCart", cart);
		
	}

}

