<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 올바른 인증값을 적은 경우는 reverse.jsp로 이동
	// 올바른 인증값을 적은 경우는 authYN이름으로 인증성공 세션을 생성.
	// 올바르지 않은 경우는 다시 인증페이지로 이동.
	request.setCharacterEncoding("utf-8");
	
	String auth = (String)session.getAttribute("auth");
	String code = request.getParameter("code");	

	if(auth != null && code != null && auth.equals(code)){
		//인증성공세션
		session.setAttribute("authYN", "Y");
		response.sendRedirect("reserve.jsp");
	}else{
		session.setAttribute("authYN", "N");
		response.sendRedirect("auth.jsp");
	}
	
	
%>