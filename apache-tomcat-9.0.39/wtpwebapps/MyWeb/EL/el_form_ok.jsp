<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	/* 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- param.태그이름으로 한번에 받아서 사용합니다. -->
	이름 : ${param.name }<br/>
	아이디 : ${param.id }<br/>
	비밀번호 : ${param.pw }<br/>
	
	
	
	
</body>
</html>