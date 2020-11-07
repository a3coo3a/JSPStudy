<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("paName");
	String avg = request.getParameter("paAvg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>축! 합격</h2>
이름 : <%=name %><br/>
평균 점수 : <%=avg %><br/>

</body>
</html>