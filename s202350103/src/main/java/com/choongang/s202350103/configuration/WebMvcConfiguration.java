package com.choongang.s202350103.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.s202350103.ybService.AdminAuthorityInterCeptor;
import com.choongang.s202350103.ybService.LoginInterCeptor;
import com.choongang.s202350103.yjService.YjInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Override					//bean 안걸어줘도 됨
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 관련 InterCeptor (비로그인 시 접근 막을 페이지)
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/mainBo");						// 관리자메인
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/adminMemberList");			// 회원목록
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberCartList");				// 장바구니
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/foGivingGift");				// 선물하기
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/foOrderDetail");				// 마이페이지 - 주문상세
		
		// 영준 InterCeptor (Parameter로 다룬 페이지)
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOrder"); 				// 내 주문
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyInfo");					// 내 정보
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQna");						// 질문 등록
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQnaOne");					// 1:1 문의
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOna");					// 내 질문
		
		// 로그인 후 관리자 권한 InterCeptor (비관리자 접근 막을 페이지)
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/mainBo");			// 관리자 메인
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberList");	// 관리자 회원목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberInfo");	// 관리자 회원상세
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/memberSearch");		// 관리자 회원검색
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boOrderList");		// 관리자 주문목록
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/boOrderDetail");	// 관리자 주문상세
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/BodetailOb");		// 관리자 중고 검수내역
	}
}