<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 로그인 연습</h2>
<form action="session_login_ok.jsp" method="post">
	아이디 : <input type="text" name="id" required="required"><br>
	비밀번호 :<input type="password" name="pw" required="required"><br>
	닉네임: <input type="text" name="nick" required="required"><br>
	<input type="submit" value="로그인"><br>
</form>

</body>
</html>