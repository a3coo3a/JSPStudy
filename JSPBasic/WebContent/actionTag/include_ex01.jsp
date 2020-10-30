<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1번페이지</h2>
디렉티브 태그의 include는 자바코드를 포함해서 전부를 가지고 들어오는 반명에
액션태그의 include는 UI만 가지고 들어옵니다.
<%@include file="include_ex02.jsp" %><br/>
total : <%=total %> 

<jsp:include page="include_ex02.jsp"/>
<%--   <%=total %>		 에러 액션태그로는 가져올 수 없다. --%>
</body>
</html>