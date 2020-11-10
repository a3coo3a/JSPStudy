package com.testweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserVO;

/*
 * 삭제는 해당 회원만 삭제할 수 있도록 권한 처리
 */
//@WebFilter({"/bbs/delete.bbs","/user/delete.user"})
public class CheckIdFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		
		
		
		res.setContentType("text/htmsl; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
			out.println("alert('동일 회원이 아닙니다');");
			out.println("location.href='/index.main';");	
		out.println("</script>");
		
		
		
		
		
		
		
		chain.doFilter(request, response);
	}

}
