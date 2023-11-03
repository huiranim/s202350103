package com.choongang.s202350103.ybDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl1 implements MemberDao {
	private final SqlSession session;
	private final HttpSession https; 
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
		
		return member;
	}

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
	



}
