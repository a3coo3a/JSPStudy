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

	<h3>1~100까지 홀수 합</h3>
	
	<%
	int sum = 0;
	for(int i = 1; i <= 100 ; i+=2){
		sum += i;
	}
	%>
	결과 : <%=sum %>
	
	<hr>
	
	<c:set var="total" value="0"/>
	<c:forEach var="i" begin="1" end="100" step="2">
		<c:set var="total" value="${total + i}"/>
	</c:forEach>
	결과 : ${total }
	
	
	<hr/>
	<h3>3단 출력</h3>
	<c:forEach var="i" begin="1" end="9" step="1">
		3 x ${i } = ${3*i }<br/>	
	</c:forEach>
	
	<hr/>
	<h3>2~9단 출력</h3>
	<c:forEach var="i" begin="2" end="9">
		<c:forEach var="j" begin="1" end="9" step="1">
			${i } x ${j } = ${i*j }<br/>
		</c:forEach>
		<br/>
	</c:forEach>
	
	<h3>향상된 포문</h3>
	<%
	int[] arr = new int[] {1,2,3,4,5};
	for(int i : arr){
		out.println(i);
	}
	%>
	<hr>
	<!-- varStatus는 현재  for의 상태값들을 확인 -->
	<c:set var="arr2" value="<%= new int[] {1,2,3,4,5} %>"/>
	<c:forEach var="i" items="${arr2 }" varStatus="s">
		arr2[${s.index }] = ${i }<br>
	</c:forEach>
	
	
	
	
	
	
	
	
	
	
</body>
</html>