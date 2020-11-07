<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- post방식은 form이 꼭 필요함 -->
<!-- post방식은 form태그에 method="post"로 지정 -->
<form action="req_post_parameter.jsp" method="post">  
		
		아이디: <input type="text" name="id" ><br/>
		비밀번호: <input type="password" name="pw" ><br/>
		
		<input type="submit"  value="확인">
</form>
</body>
</html>
<!-- post 방식
	http://localhost:8181/JSPBasic/request/req_post_parameter.jsp
	
	이렇게 주소에 값이 보이지 않음.
	단, 그냥 보낼시 한글이 깨짐
	받는 쪽에서 받기 직전에 인코딩 형식을 utf-8로 지정해야함.
	 -->
	 
	 <!-- 인코딩은 암호화, 디코딩은 암호해독 -->