<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	get 방식은 form이 반드시 필요한 것은 아니며, 
	주소를 통해서 강제로 파라미터를 전달할 수 있습니다. 
	
	파라미터값은 주소뒤에 
	?변수명=값
	형식으로 전달되며,
	여러값이라면 &로 연결
	-->
	<a href="req_get_result.jsp?name=홍길자&number=1234&id=kkk123">req_get_result.jsp 페이지로</a>
	
</body>
</html>