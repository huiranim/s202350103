package com.choongang.s202350103.ybService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.choongang.s202350103.model.Member;

public class AdminAuthorityInterCeptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AdminAuthorityInterCeptor preHandle() Start...");
		// session 객체를 가져옴
        HttpSession session = request.getSession();
        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
        Object obj = session.getAttribute("member");
        
       	//  비 로그인 시 
    	if(obj == null) {
			response.sendRedirect("/loginForm");
			return false;
		}
        
        if(obj != null) {
        	// 로그인 후 관리자 아니면 관리자 페이지 접근 X
        	Member member = (Member) session.getAttribute("member");
        	if(member.getM_admin() != 1) {
        		System.out.println("AdminAuthorityInterCeptor Start... You do not have permission. Just Administrator allow");
                response.sendRedirect("custom404");
                return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        	}
       
        }

        // preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
        // 따라서 true로하면 컨트롤러 uri로 가게 됨.

        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	
}


