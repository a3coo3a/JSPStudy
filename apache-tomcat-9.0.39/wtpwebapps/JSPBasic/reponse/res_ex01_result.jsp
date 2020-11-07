<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 순수 자바코드만 입력되는 처리 부분
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	// age에 따른 다른 결과페이지를 보여주고 싶다면??
	int a = Integer.parseInt(age);	
	
	if( a >= 20 ){
		response.sendRedirect("res_ex01_ok.jsp");	// 보여줄 url주소
	}else{
		response.sendRedirect("res_ex01_no.jsp");
	}
%>
