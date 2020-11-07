<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// 1. id, pw를 받는다
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 2. id = abc1234, 비밀번호가 xxx123면 로그인 성공
	// 로그인 성공시 res_ex02_welcome.jsp로 리다이렉트
	// id가 틀린경우 res_ex02_id_fail로 리다이렉트
	// pw가 틀린경우 res_ex02_pw_fail로 리다이렉트
	
	if(id.equals("abc1234") && pw.equals("xxx123")){
		response.sendRedirect("res_ex02_welcome.jsp");
	}else if(id.equals("abc1234")){
		response.sendRedirect("res_ex02_pw_fail.jsp");
	}else{
		response.sendRedirect("res_ex02_id_fail.jsp");
	}
	
	
	
	
	
	
%>