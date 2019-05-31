package com.icia.blueballoon.util.interceptor;


import javax.servlet.http.*;

import org.springframework.security.core.*;
import org.springframework.security.core.context.*;
import org.springframework.web.servlet.handler.*;

import com.icia.blueballoon.exception.*;


public class AuthorizationInterceptor extends HandlerInterceptorAdapter {
	// 컨트롤러를 실행하기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(!auth.getPrincipal().toString().equals("anonymousUser"))
			throw new IllegalAuthorizationException();
		return super.preHandle(request, response, handler);
	}
}
