<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String select = request.getParameter("sel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<h2>강의 영상</h2>
		<hr/>
		<%if(select == null){ %>
			잘못된 접근입니다.
		<% }else if(select.equals("java")){ %>
		<p>자바 수업 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/SXX2cnmL0Ng" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<%} else if(select.equals("js")){ %>
		<p>자바스크립트 수업 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/V7o7bLRpfXg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<%}else if(select.equals("oracle")){ %>
		<p>오라클 설치과정</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/qjVt_0wwNMY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<%} %>
	
		</div>
</body>
</html>