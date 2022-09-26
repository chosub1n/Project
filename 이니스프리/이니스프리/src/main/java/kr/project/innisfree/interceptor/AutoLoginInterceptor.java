package kr.project.innisfree.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.project.innisfree.service.MemberService;
import kr.project.innisfree.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService memberService;

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			Cookie cookie = WebUtils.getCookie(request, "innisfreeCookie");
			if(cookie != null) {
				String me_s_email = cookie.getValue();
				user = memberService.loginBySession(me_s_email);
				if(user != null)
					session.setAttribute("user", user);
			}
		}
		return true;
	}

}
