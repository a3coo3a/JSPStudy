<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 경로 : "/JSPBasic/Forward" or "../Forward" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바코드로 포워드를 사용하는 방법</h2>
	<form action="/JSPBasic/Forward" method="post">
		ID:<input type="text" name="id"><br/>
		<input type="submit" value="확인">
	</form>
</body>
</html>