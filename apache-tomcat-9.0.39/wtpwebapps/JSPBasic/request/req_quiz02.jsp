<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 30번의 학생 a태그로 생성 -->
<%
int no = 0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>req_quiz02.jsp</h2>

다음을 구현하고 a태그 클릭시 req_quiz02_result에 학생번호를 출력하세요<br/><br/>

<%for(no = 1; no <= 30; no++){ %>
<a href="req_quiz02_result.jsp?no=<%=no  %>"><%=no %>번 학생</a><br/>
<%} %>


</body>
</html>