<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%-- <jsp: 으로 시작하고 종속되는 태그가 없으면 끝부분을 반드시 (/>)로 마감 처리합니다.안적으면 error --%>
	 <jsp:forward page="forward_ex02.jsp"/>
	 
	 <%-- forward로 이동시 request값이 넘어간 페이지 까지 유지가 됨. 
	 	redirect로 이동시 생명주기가 끝나 없어짐.
	 --%>
	 
	 
</body>
</html>