package com.choongang.s202350103.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.choongang.s202350103.ybService.LoginInterCeptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	@Override					//bean 안걸어줘도됨
	public void addInterceptors(InterceptorRegistry registry) {
		// 누군가 URL /interCeptor --> SampleInterCeptor() 처리 해줌
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/mainBo");
		registry.addInterceptor(new LoginInterCeptor()).addPathPatterns("/adminMemberList");
	}
}
