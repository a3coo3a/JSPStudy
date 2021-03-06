package com.testweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserVO;


/**
 *  Filter를 이용해서 글작성, 수정, 삭제는 해당 회원만 삭제할 수 있도록 권한 처리
 */
@WebFilter({"/bbs/write.bbs","/bbs/modify.bbs","/bbs/updateForm.bbs","/bbs/writeForm.bbs","/bbs/delete.bbs","/user/logout.user","/user/mypage.user","/user/mypageinfo.user","/user/delete.user","/user/modify.user"})		
public class BbsFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		UserVO user = (UserVO)session.getAttribute("user");
		
		if(user == null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			
			out.println("<script>");
				out.println("alert('로그인이 필요한 서비스입니다');");
				out.println("location.href='/TestWeb/user/login.user';");	
			out.println("</script>");
			
			return;
		}
		
		chain.doFilter(request, response);
	}
	
}
