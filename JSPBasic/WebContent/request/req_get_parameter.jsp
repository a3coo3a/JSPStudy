<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//form으로 전송된 데이터를 받음.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String major = request.getParameter("major");
	String[] inter = request.getParameterValues("inter");   //여러개의 값, 체크박스
	String phone1 = request.getParameter("phone1");
    String txt = request.getParameter("txt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>req_get_form에서 req_get_parameter로 넘어온 값</h2>
	아이디 : <%=id %><br/>
	패스워드 : <%=pw %><br/>
	이메일 : <%=email %><br/>
	전공 : <%=major %><br/>
	관심분야 : <%=Arrays.toString(inter) %><br/>
	통신사 : <%=phone1 %><br/>
	자기소개 : <%=txt %><br/>
</body>
</html>

<!-- get 방식 
http://localhost:8181/JSPBasic/request/req_get_parameter.jsp?id=%EC%9D%B8%EC%98%81&pw=sssss&email=aaa%40aaa.com&major=%EA%B2%BD%EC%98%81%ED%95%99&inter=DB&inter=JSP&inter=JavaScript&phone1=SKT&txt=ssss
처럼 주소뒤에 ?뒤로 "변수명=값"의 형태로 문자열로 넘어감.
개인정보의 경우 그래서 get방식으로 보내면 안됨.
-->


