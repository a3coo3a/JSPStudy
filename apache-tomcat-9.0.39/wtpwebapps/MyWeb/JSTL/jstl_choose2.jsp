<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- choose태그를 이용해서 90이상이면  A
		80 B
		70 C
		나머지 F
	90점 이상일때는 중첩if구문의 형태로  A와  A+로 나누어 표현 -->
	
	<c:choose>
		<c:when test="${param.score >= 90 }">
			<c:choose>
				<c:when test="${param.score >= 95 }">
					<h2>A+</h2>
				</c:when>
				<c:otherwise>
					<h2>A</h2>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${param.score >= 80 }">
			<h2>B</h2>
		</c:when>
		<c:when test="${param.score >= 70 }">
			<h2>C</h2>
		</c:when>
		<c:otherwise>
			<h2>F</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>