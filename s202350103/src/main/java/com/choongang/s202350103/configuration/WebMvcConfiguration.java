package com.choongang.s202350103.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.s202350103.ybService.AdminAuthorityInterCeptor;
import com.choongang.s202350103.ybService.LoginInterCeptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Override					//bean 안걸어줘도됨
	public void addInterceptors(InterceptorRegistry registry) {
		// 로그인 관련 InterCeptor
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/mainBo");
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/adminMemberList");
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/memberPointList");
		
		
		
		// 로그인 후 관리자 권한 InterCeptor
		registry.addInterceptor(new  AdminAuthorityInterCeptor()).addPathPatterns("/mainBo");
	}
}
