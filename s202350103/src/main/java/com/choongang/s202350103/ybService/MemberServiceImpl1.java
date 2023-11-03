package com.choongang.s202350103.ybService;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.choongang.s202350103.model.Cart;
import com.choongang.s202350103.model.Member;
import com.choongang.s202350103.ybDao.MemberDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl1 implements MemberService {
	private final MemberDao md;
	private final HttpSession session;
	
	@Override
	public Member login(Member member1) {
		System.out.println("MemberServiceImpl1 login Start");
		member1 = md.login(member1);
		
		return member1;
	}


	@Override
	public int totalCart(Member member) {
		System.out.println("MemberServiceImpl1 totalCart Start...");
		int totalCart = md.totalCart(member);
		System.out.println("MemberServiceImpl1 totalCart totalCart -> "  + totalCart);
		return totalCart;
	}


	@Override
	public List<Cart> listCart(Cart cart, Member member) {
		
		member =(Member) session.getAttribute("member");
		System.out.println("MemberService listCart start...");
		System.out.println("MemberDaoImpl1 listCart() member.m_num -> " + member.getM_num());
		List<Cart> listCart = md.listCart(cart, member);
		
		return listCart;
	}


	@Override
	public int totalPrice(Member member) {
		System.out.println("MemberService totalPrice start...");
		System.out.println("MemberDaoImpl1 totalPrice member.m_num -> " + member.getM_num());
		int totalPrice = 0;
		
		totalPrice = md.totalPrice(member);
		return 0;
	}
	
}
