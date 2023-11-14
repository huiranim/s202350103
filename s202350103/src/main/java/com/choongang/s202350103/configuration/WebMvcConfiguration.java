package com.choongang.s202350103.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.s202350103.ybService.AdminAuthorityInterCeptor;
import com.choongang.s202350103.ybService.LoginInterCeptor;
import com.choongang.s202350103.yjService.YjInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Override					//bean 안걸어줘도됨
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 관련 InterCeptor
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/mainBo");
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/adminMemberList");
		
		// 영준 인터셉터
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOrder"); // 내 주문
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyInfo");	// 내 정보
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQna");		// 질문 등록
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberQnaOne");	// 1:1 문의
		registry.addInterceptor(new YjInterceptor()).addPathPatterns("/memberMyOna");	// 내 질문
		
		//	비밀글 조회 처리 전
		
		// 로그인 후 관리자 권한 InterCeptor
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/mainBo");
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberList");
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/adminMemberInfo");
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/memberSearch");
		
	}
}
