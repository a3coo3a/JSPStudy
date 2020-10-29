<%@page import="com.session.UserRepository"%>
<%@page import="com.session.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션정보가 없는 경우 로그인화면으로
if(session.getAttribute("login") == null){
	response.sendRedirect("login01.jsp");
}



User user = (User)session.getAttribute("login");
UserRepository.deleteUser(user.getId());
	session.invalidate();

response.sendRedirect("login01.jsp");
 	
%>