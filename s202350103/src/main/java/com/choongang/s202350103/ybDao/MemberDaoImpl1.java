package com.choongang.s202350103.ybDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.model.PointList;
import com.choongang.s202350103.model.WishList;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl1 implements MemberDao {
	private final SqlSession session;
	private final HttpSession https; 
	// 로그인
	@Override
	public Member login(Member member1) {
		System.out.println("MemberDaoImpl login Start...");
		Member member = null;
		 
		try {
			member = session.selectOne("ybUserLogin", member1);
			System.out.println("MemberDaoImpl login member1 -> " + member.getM_id());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if(member == null) {
			return null;
		} else {
			return member;			
		}
	}
	// 장바구니 총 개수
	@Override
	public int totalCart(Member member) {
		System.out.println("MemberDaoImpl1 totalCart start...");
			int totalCart = 0;
			System.out.println("MemberDaoImpl1 totalCart member -> " + member.getM_id());
		try {
			totalCart = session.selectOne("ybTotalCart", member);	
			System.out.println("MemberDaoImpl1 totalCart() totalCart -> " + totalCart);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalCart() Exception -> " + e.getMessage());
		}
		
		return totalCart;
	}
	// 판매 총 개수
	@Override
	public int totalSellCnt(Member member) {
		System.out.println("MemberDaoImpl1 totalSellCnt() start...");
		int totalSellCnt = 0;
		System.out.println("MemberDaoImpl1 totalSellCnt member -> " + member.getM_num());
		try {
			totalSellCnt = session.selectOne("ybTotalSellCnt", member);
			System.out.println("MemberDaoImpl1 totalSellCnt() totalCart -> " + totalSellCnt);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalSellCnt() Exception -> " + e.getMessage());
		}
		return totalSellCnt;
	}
	
	// 장바구니 총 가격
	@Override
	public int totalPrice(Member member) {
		System.out.println("MemberDaoImpl1 totalPrice() start...");
		int totalPrice = 0;
		try {
			totalPrice = session.selectOne("ybTotalPrice", member);
			System.out.println("MemberDaoImpl1 totalPrice totalPrice -> " + totalPrice);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalPrice Exception -> " + e.getMessage());
		}
		return totalPrice;
	}
	// 찜목록
	@Override
	public int totalWishList(Member member) {
		System.out.println("MemberDaoImpl1 totalWishList start...");
		int totalWishList = 0;
		System.out.println("MemberDaoImpl1 totalWishList member -> " + member.getM_id());
		try {
			totalWishList = session.selectOne("ybTotalWishList", member);	
			System.out.println("MemberDaoImpl1 totalWishList() totalWishList -> " + totalWishList);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 totalWishList() Exception -> " + e.getMessage());
		}
	
	return totalWishList;
	}
	
	// 장바구니 리스트
	@Override
	public List<Cart> listCart(Cart cart, Member member) {
		
		member =(Member) https.getAttribute("member");
		List<Cart> listCart = new ArrayList<Cart>();
		System.out.println("MemberDaoImpl1 listCart() start...");
		cart.setM_num(member.getM_num());
		System.out.println("MemberDaoImpl1 listCart() cart.m_num -> " +cart.getM_num());
		System.out.println("MemberDaoImpl1 listCart() member.m_num -> " + member.getM_num());
		try {
			listCart = session.selectList("ybListCart", cart);
			
			System.out.println("MemberDaoImpl1 listCart.size() -> " + listCart.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 listCart Exception -> " + e.getMessage());
		}
		
		return listCart;
	}
	// 찜 목록 리스트
	@Override
	public List<WishList> memberWishList(WishList wishList) {
		Member member =(Member) https.getAttribute("member");
		List<WishList> memberWishList = new ArrayList<WishList>();
		System.out.println("MemberDaoImpl1 memberWishList() start...");
		wishList.setM_num(member.getM_num());
		System.out.println("MemberDaoImpl1 memberWishList() wishList.m_num -> " +wishList.getM_num());
		System.out.println("MemberDaoImpl1 memberWishList() member.m_num -> " + member.getM_num());
		try {
			memberWishList = session.selectList("ybWishList", wishList);
			
			System.out.println("MemberDaoImpl1 memberWishList.size() -> " + memberWishList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberWishList Exception -> " + e.getMessage());
		}
		return memberWishList;
	}
	// 포인트리스트
	@Override
	public List<PointList> memberPointList(PointList pointList) {
		Member member =(Member) https.getAttribute("member");
		List<PointList> memberPointList = new ArrayList<PointList>();
		pointList.setM_num(member.getM_num());
		
		try {
			memberPointList = session.selectList("ybMemberQuizList", pointList);
			System.out.println("MemberDaoImpl1 memberPointList.size() -> " + memberPointList.size());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberPointList Exception -> " + e.getMessage());
		}
		return memberPointList;
	}
	
	// 회원 탈퇴
	@Override
	public Member memberWithdraw(Member member) {
		System.out.println("MemberDaoImpl1 memberWithdraw() start...");
		member =(Member) https.getAttribute("member");
		System.out.println("MemberDaoImpl1 memberWithdraw() member.m_num -> " + member.getM_num());
		try {
			member = session.selectOne("ybMemberWithdraw", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberWithdraw Exception -> " + e.getMessage());
		}
		return member;
	}
	
	// 회원 로그인 체크
	@Override
	public Member memberChk(String chk_Id) {
		System.out.println("MemberDaoImpl1 memberChk() start...");
			Member member = new Member();
		try {
			member = session.selectOne("ybMemberChk", chk_Id);	
		} catch (Exception e) {
			System.out.println("MemberDaoImpl1 memberChk() Exception -> " + e.getMessage());
		}
		if(chk_Id == null) {
			return null;	
		} else {
			return member;
		}
		
	}
	

	

	
	



}
