<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 선언 
	어디서 선언을 해도 사용하는데 상관은 없으나 보통 doctype 위에 사용-->
<%!// 선언은 전역의의미로 사용되고, 메서드 선언이 가능
	public int i = 10;
	public String str = "WEB";

	public int method(int a, int b) {
		return a + b;
	}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("i값 : " + i);
		out.println("str값 : " + str);
		out.println("메서드 호출 : " + method(10,5));
		
	%>


</body>
</html>