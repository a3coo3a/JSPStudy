<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>아래 값들을 2020년05월03일 형식으로 변경해서 출력</h2>
	
	<c:set var="TIME_A" value="2020-05-03" />
	<c:set var="TIME_B" value="2020/05/03" />
	<c:set var="TIME_C" value="2020-05-03 21:30:22" />
	<c:set var="TIME_D" value="<%=new Date() %>" />
	
	<fmt:parseDate var="A" value="${TIME_A }" pattern="yyyy-MM-dd"/>
	<fmt:formatDate var="a" value="${A }" pattern="yyyy년MM월dd일"/>
	TIME_A : ${a }
	<br/>
	<fmt:parseDate var="B" value="${TIME_B }" pattern="yyyy/MM/dd"/>
	<fmt:formatDate var="b" value="${B }" pattern="yyyy년MM월dd일"/>
	TIME_B : ${b }
	<br/>
	<fmt:parseDate var="C" value="${TIME_C }" pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate var="c" value="${C }" pattern="yyyy년MM월dd일"/>
	TIME_C : ${c }
	<br/>
	<fmt:formatDate var="d" value="${TIME_D }" pattern="yyyy년MM월dd일"/>
	TIME_D : ${d }
	
	<br/>
</body>
</html>